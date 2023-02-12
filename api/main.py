from http.client import HTTPException
from typing import List
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.responses import FileResponse

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

@app.get("/copy_code")
async def copy_code(path_to_file: str):
    try:
        file = open(f"../flutterwidgets/{path_to_file}",mode='r')
        content = file.read()
        print(content)
        return {
            "content": content
        }
    except Exception as e: 
        print(e)
        return HTTPException()

@app.get("/download_file")
async def copy_code(path_to_file: str, file_name:str):
    try:
        return FileResponse(f"../flutterwidgets/{path_to_file}", media_type='application/octet-stream',filename=file_name)
    except Exception as e: 
        print(e)
        return HTTPException()