from sqlalchemy import Column, BIGINT, VARCHAR, TEXT
from auth_service.models import BaseModel


class EventsModel(BaseModel):
    __tablename__ = 'events'

    id = Column(BIGINT, primary_key=True, autoincrement=True)
    name = Column(VARCHAR(255), nullable=False)
    login = Column(VARCHAR(255), nullable=False, unique=True)
    password = Column(VARCHAR(255), nullable=False)
    map_url = Column(VARCHAR(255), nullable=True)
    faq = Column(TEXT, nullable=True)
