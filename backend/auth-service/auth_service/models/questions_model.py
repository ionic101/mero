from sqlalchemy import Column, BIGINT, VARCHAR, ForeignKey
from auth_service.models import BaseModel


class QuestionsModel(BaseModel):
    __tablename__ = 'questions'

    id = Column(BIGINT, primary_key=True)
    question = Column(VARCHAR(1000), nullable=False)
    answer = Column(VARCHAR(1000))
    questioner_id = Column(
        BIGINT,
        ForeignKey('participants.id', ondelete='SET NULL', onupdate='CASCADE'),
        nullable=True
    )
    answering_id = Column(
        BIGINT,
        ForeignKey('participants.id', ondelete='SET NULL', onupdate='CASCADE'),
        nullable=True
    )
