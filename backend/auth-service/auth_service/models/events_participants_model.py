from sqlalchemy import Column, BIGINT, ForeignKey
from auth_service.models import BaseModel


class EventsParticipantsModel(BaseModel):
    __tablename__ = 'events_participants'

    id = Column(BIGINT, primary_key=True, index=True)
    token = Column(BIGINT, nullable=False, unique=True)
    event_id = Column(
        BIGINT,
        ForeignKey('events.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
    participant_id = Column(
        BIGINT,
        ForeignKey('participants.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
