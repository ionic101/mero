from sqlalchemy import Column, BIGINT, VARCHAR, TIMESTAMP
from auth_service.models import BaseModel


class ParticipantsModel(BaseModel):
    __tablename__ = 'participants'

    id = Column(BIGINT, primary_key=True, autoincrement=True)
    name = Column(VARCHAR(255), nullable=False)
    surname = Column(VARCHAR(255), nullable=False)
    birth_date = Column(TIMESTAMP(timezone=True))
