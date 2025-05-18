from sqlalchemy import Column, BIGINT, ForeignKey
from auth_service.models import BaseModel


class EventsPartnersModel(BaseModel):
    __tablename__ = 'events_partners'

    id = Column(BIGINT, primary_key=True, index=True)
    event_id = Column(
        BIGINT,
        ForeignKey('events.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
    partner_id = Column(
        BIGINT,
        ForeignKey('partners.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
