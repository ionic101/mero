from pydantic import BaseModel, validator
from datetime import date, datetime


class ParticipantCreateRequest(BaseModel):
    name: str
    surname: str
    birth_date: date

    @validator('birth_date', pre=True)
    def parse_custom_date(cls, value):
        try:
            return datetime.strptime(value, '%d.%m.%Y').date()
        except ValueError:
            raise ValueError('Invalid format. Correct form: 01.01.2000')
