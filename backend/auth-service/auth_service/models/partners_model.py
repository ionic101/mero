from sqlalchemy import Column, INT, CHAR, ForeignKey, VARCHAR, UUID, TIMESTAMP, func
import uuid

from auth_service.models import BaseModel


class ClientsModel(BaseModel):
    __tablename__ = 'clients'
    
    id = Column(INT, primary_key=True, index=True)
    sub = Column(UUID, unique=True, default=uuid.uuid4, nullable=False)
    phone_number = Column(VARCHAR(15), unique=True, nullable=False)
    first_name = Column(VARCHAR(128), nullable=False)
    second_name = Column(VARCHAR(128), nullable=False)
    created_at = Column(TIMESTAMP(timezone=True), server_default=func.current_timestamp(), nullable=False)
    updated_at = Column(TIMESTAMP(timezone=True), server_default=func.current_timestamp(), server_onupdate=func.current_timestamp(), nullable=False)
