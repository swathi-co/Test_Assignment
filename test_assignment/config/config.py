import os
from dotenv import load_dotenv

# Load env file
load_dotenv()

# Get current env (required)
ENV = os.getenv("ENV")
if not ENV:
    raise ValueError("❌ ENV not set in .env file (choose dev/qa/prod)")
ENV = ENV.lower()

# Read credentials for selected env
USER = os.getenv(f"{ENV.upper()}_USER")
PASS = os.getenv(f"{ENV.upper()}_PASS")
BASE_URL = os.getenv(f"{ENV.upper()}_URL")

if not USER or not PASS or not BASE_URL:
    raise ValueError(f"❌ Missing values for {ENV}. Please check .env file.")

# Robot will automatically see these as variables:
# ${ENV}, ${USER}, ${PASS}, ${BASE_URL}