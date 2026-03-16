import os
from dotenv import load_dotenv
load_dotenv(dotenv_path="./.env")
API_KEY=os.getenv("API_KEY")
print("Test file executed successfully")
print(f"API_KEY is: {API_KEY}")