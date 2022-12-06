from fastapi import APIRouter
from server.api.types import Coupon

router = APIRouter()


@router.get("/coupons/info/")
async def coupon_info(coupon_id: str = "default") -> Coupon:
    print(coupon_id)
    return Coupon(coupon_id=coupon_id, image_url=f"/img/coupon_{coupon_id}.png")
