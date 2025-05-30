from sqlalchemy import Column, Integer, String, Float, ForeignKey, DateTime, Table
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime

Base = declarative_base()

# Таблица связи пользователей и мероприятий
event_participants = Table(
    'event_participants',
    Base.metadata,
    Column('user_id', Integer, ForeignKey('users.id'), primary_key=True),
    Column('event_id', Integer, ForeignKey('events.id'), primary_key=True)
)

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    password = Column(String)
    phone = Column(String)
    first_name = Column(String)
    last_name = Column(String)
    photo_url = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    # Связь с мероприятиями
    events = relationship("Event", secondary=event_participants, back_populates="participants")

class News(Base):
    __tablename__ = "news"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    description = Column(String)
    photo_url = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class Event(Base):
    __tablename__ = "events"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    description = Column(String)
    photo_url = Column(String, nullable=True)
    price = Column(String)  # Цена в формате строки
    event_date = Column(DateTime)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    # Связь с пользователями
    participants = relationship("User", secondary=event_participants, back_populates="events")

class Advertisement(Base):
    __tablename__ = "advertisements"

    id = Column(Integer, primary_key=True, index=True)
    photo_url = Column(String)
    created_at = Column(DateTime, default=datetime.utcnow) 