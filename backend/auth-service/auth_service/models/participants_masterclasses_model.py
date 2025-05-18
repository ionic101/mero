from sqlalchemy import Column, BIGINT, ForeignKey
from auth_service.models import BaseModel


class ParticipantsMasterclassesModel(BaseModel):
    __tablename__ = 'participants_masterclasses'

    id = Column(BIGINT, primary_key=True, index=True)
    participant_id = Column(
        BIGINT,
        ForeignKey('participants.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
    masterclass_id = Column(
        BIGINT,
        ForeignKey('masterclasses.id', ondelete='CASCADE', onupdate='CASCADE'),
        nullable=False
    )
