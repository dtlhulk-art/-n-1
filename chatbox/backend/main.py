from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatIn(BaseModel):
    message: str

@app.get("/")
def hello():
    return {"message": "Backend đang chạy"}

@app.post("/api/chat")
def chat(body: ChatIn):
    return {"answer": f"Bạn vừa hỏi: {body.message}"}