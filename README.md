Project Review 
    This Repo contains Automated UI and API Testcases using Python with Robot Framework
    Test Execution "robot --outputdir results tests/"
Folder Structure
├── testscases/                   # Robot test cases
     ├── login.robot
     └── events.robot
     └── Data.robot
     └── EventsAPI.robot
     └──writeKey.robot
├── resources/               # Reusable keywords & locators
│   ├── LoginPage.resource
│   ├── ConnectionsPage.resource
│ 
├── libraries/               # Python helper libraries
│   ├── EventAPI.py        # API calls to Rudderstack
│   ├── __init__.py
├── config/                  
│   └── config.py            # loads env variables
├── .env                     # Default environment
├── requirements.txt
├── README.md
└── .github/workflows/tests.yml
