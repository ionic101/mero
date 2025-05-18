from sqlalchemy import Column, BIGINT, VARCHAR
from event_service.models import BaseModel


class PartnersModel(BaseModel):
    __tablename__ = 'partners'

    id = Column(BIGINT, primary_key=True, autoincrement=True)
    name = Column(VARCHAR(255), nullable=False)
    login = Column(VARCHAR(255), nullable=False, unique=True)
    password = Column(VARCHAR(255), nullable=False)
