from sqlalchemy import Column, BIGINT, VARCHAR, TIMESTAMP, INT, ForeignKey
from auth_service.models import BaseModel


class MasterclassesModel(BaseModel):
    __tablename__ = 'masterclasses'

    id = Column(BIGINT, primary_key=True, autoincrement=True)
    name = Column(VARCHAR(255), nullable=False)
    time_start = Column(TIMESTAMP(timezone=True), nullable=False)
    time_end = Column(TIMESTAMP(timezone=True), nullable=False)
    description = Column(VARCHAR(1000))
    max_count_participants = Column(INT, nullable=False)
    partner_id = Column(
        BIGINT,
        ForeignKey('partners.id', ondelete='RESTRICT', onupdate='CASCADE'),
        nullable=False
    )
