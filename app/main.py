import random

from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/")
async def status():
    val = random.randint(0, 1)
    if val == 0:
        return JSONResponse(status_code=200, content={"status": "Active"})
    else:
        return JSONResponse(status_code=500, content={"status": "Inactive"})