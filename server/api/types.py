from pydantic import BaseModel
from typing import Optional


class Coupon(BaseModel):
    coupon_id: str
    image_url: str
    description: Optional[str] = None
