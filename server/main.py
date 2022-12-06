from fastapi import FastAPI
from server.api.routers import coupon
import uvicorn

app = FastAPI()
app.include_router(coupon.router)


@app.get("/")
def root():
    return dict(couponID="coupon2022", imageID="coupon2022img")


if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=2434)
