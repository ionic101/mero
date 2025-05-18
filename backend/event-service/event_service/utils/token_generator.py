import random
from event_service.utils.config import config


def generate() -> str:
    return ''.join(random.choices(config.TOKEN_SYMB, k=config.TOKEN_LENGTH))
