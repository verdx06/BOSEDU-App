from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from datetime import timedelta
from typing import List
import models, schemas, security
from database import engine, get_db
from sqlalchemy import func
from sqlalchemy.exc import IntegrityError

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Аутентификация
@app.post("/token", response_model=schemas.Token)
async def login_for_access_token(
    user_login: schemas.UserLogin,
    db: Session = Depends(get_db)
):
    user = db.query(models.User).filter(models.User.email == user_login.email).first()
    if not user or not security.verify_password(user_login.password, user.password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    access_token_expires = timedelta(minutes=security.ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = security.create_access_token(
        data={"sub": user.email}, expires_delta=access_token_expires
    )
    return {"access_token": access_token, "token_type": "bearer"}

# Пользователи
@app.post("/users/", response_model=schemas.User)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.email == user.email).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Email already registered")
    hashed_password = security.get_password_hash(user.password)
    db_user = models.User(
        email=user.email,
        name=user.name,
        password=hashed_password,
        photo_url=user.photo_url
    )
    db.add(db_user)
    try:
        db.commit()
    except IntegrityError:
        db.rollback()
        raise HTTPException(status_code=400, detail="Email already registered (db constraint)")
    db.refresh(db_user)
    return db_user

@app.get("/users/", response_model=List[schemas.User])
def read_users(
    skip: int = 0,
    limit: int = 100,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    users = db.query(models.User).offset(skip).limit(limit).all()
    return users

# Новости (только GET методы)
@app.get("/news/", response_model=List[schemas.News])
def read_news(
    skip: int = 0,
    limit: int = 100,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    news = db.query(models.News).offset(skip).limit(limit).all()
    return news

@app.get("/news/{news_id}", response_model=schemas.News)
def read_news_item(
    news_id: int,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    news = db.query(models.News).filter(models.News.id == news_id).first()
    if news is None:
        raise HTTPException(status_code=404, detail="News not found")
    return news

# События (CRUD)
@app.post("/events/", response_model=schemas.Event)
def create_event(
    event: schemas.EventCreate,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    db_event = models.Event(**event.dict())
    db.add(db_event)
    db.commit()
    db.refresh(db_event)
    return db_event

@app.get("/events/", response_model=List[schemas.Event])
def read_events(
    skip: int = 0,
    limit: int = 100,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    events = db.query(models.Event).offset(skip).limit(limit).all()
    return events

@app.get("/events/{event_id}", response_model=schemas.Event)
def read_event(
    event_id: int,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    event = db.query(models.Event).filter(models.Event.id == event_id).first()
    if event is None:
        raise HTTPException(status_code=404, detail="Event not found")
    return event

@app.put("/events/{event_id}", response_model=schemas.Event)
def update_event(
    event_id: int,
    event: schemas.EventCreate,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    db_event = db.query(models.Event).filter(models.Event.id == event_id).first()
    if db_event is None:
        raise HTTPException(status_code=404, detail="Event not found")
    
    for key, value in event.dict().items():
        setattr(db_event, key, value)
    
    db.commit()
    db.refresh(db_event)
    return db_event

@app.delete("/events/{event_id}")
def delete_event(
    event_id: int,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    db_event = db.query(models.Event).filter(models.Event.id == event_id).first()
    if db_event is None:
        raise HTTPException(status_code=404, detail="Event not found")
    
    db.delete(db_event)
    db.commit()
    return {"message": "Event deleted"}

# Регистрация на события
@app.post("/event-registrations/")
def register_for_event(
    event_participant: schemas.EventParticipant,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    # Проверяем существование пользователя и события
    user = db.query(models.User).filter(models.User.id == event_participant.user_id).first()
    event = db.query(models.Event).filter(models.Event.id == event_participant.event_id).first()
    
    if not user or not event:
        raise HTTPException(status_code=404, detail="User or Event not found")
    
    # Добавляем пользователя к событию
    event.participants.append(user)
    db.commit()
    return {"message": "Successfully registered for event"}

@app.get("/event-registrations/{event_id}/count")
def get_event_participants_count(
    event_id: int,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    # Подсчитываем количество участников события
    count = db.query(func.count(models.event_participants.c.user_id))\
        .filter(models.event_participants.c.event_id == event_id)\
        .scalar()
    
    return {"event_id": event_id, "participants_count": count}

# Реклама
@app.post("/advertisements/", response_model=schemas.Advertisement)
def create_advertisement(
    ad: schemas.AdvertisementCreate,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    db_ad = models.Advertisement(**ad.dict())
    db.add(db_ad)
    db.commit()
    db.refresh(db_ad)
    return db_ad

@app.get("/advertisements/", response_model=List[schemas.Advertisement])
def read_advertisements(
    skip: int = 0,
    limit: int = 100,
    db: Session = Depends(get_db),
    token: str = Depends(security.oauth2_scheme)
):
    ads = db.query(models.Advertisement).offset(skip).limit(limit).all()
    return ads