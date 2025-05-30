from pydantic import BaseModel
from datetime import datetime
from typing import Optional, List

# User schemas
class UserBase(BaseModel):
    username: str
    phone: str
    first_name: str
    last_name: str
    photo_url: Optional[str] = None

class UserCreate(UserBase):
    password: str

class User(UserBase):
    id: int
    created_at: datetime

    class Config:
        from_attributes = True

# News schemas
class NewsBase(BaseModel):
    title: str
    description: str
    photo_url: Optional[str] = None

class NewsCreate(NewsBase):
    pass

class News(NewsBase):
    id: int
    created_at: datetime

    class Config:
        from_attributes = True

# Event schemas
class EventBase(BaseModel):
    title: str
    description: str
    photo_url: Optional[str] = None
    price: str
    event_date: datetime

class EventCreate(EventBase):
    pass

class Event(EventBase):
    id: int
    created_at: datetime

    class Config:
        from_attributes = True

# Advertisement schemas
class AdvertisementBase(BaseModel):
    photo_url: str

class AdvertisementCreate(AdvertisementBase):
    pass

class Advertisement(AdvertisementBase):
    id: int
    created_at: datetime

    class Config:
        from_attributes = True

# Token schemas
class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: Optional[str] = None

# Event Participant schema
class EventParticipant(BaseModel):
    event_id: int
    user_id: int 