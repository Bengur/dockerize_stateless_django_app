### Presuming you already have installed docker + docker-compose on your machine and started your Django project 

## Step 1. Make the project stateless : run 
    
    pip install python-dotenv 

In your project settings.py file add the following: 

    import os
    from pathlib import Path
    from dotenv import load_dotenv
    
    load_dotenv(verbose=True)
    env_path = Path('.') / '.env'
    load_dotenv(dotenv_path=env_path) 
    
In your project settings.py file change database settings to :

        DATABASES = {
        'default': {
            'ENGINE': os.getenv("DB_ENGINE"),
            'NAME': os.getenv("DB_NAME"),
            'USER': os.getenv("DB_USER"),
            'PASSWORD': os.getenv("DB_PASSWORD"),
            'HOST': os.getenv("DB_HOST"),
            'PORT': os.getenv("DB_PORT")
        }
    }


## Step 2. Handle requirements : run 

    pip freeze 

In your project directory create requirements.txt file
Copy and paste to requirements.txt file the output of pip freeze 


## Step 3. Build your custom docker image
     
Copy and paste Dockerfile to your project directory
Cd to your project directory and run
    
    docker build -t your_docker_image_name . 


    
## Step 4. Deploying with docker-compose 

Copy and paste docker-compose.yml file anywhere 
In the same directory where docker-compose.yml is create .env file 

In .env file set your database settings, e.g.:
    
    DB_ENGINE = 'django.db.backends.postgresql_psycopg2'
    DB_NAME = 'your_db_name'
    DB_USER = 'your_db_user'
    DB_PASSWORD = 'your_db_password'
    DB_HOST = 'db'
    DB_PORT = '5432'

Modify docker-compose file as you need. Be sure that db/db_user/db_password settings in both files are the same 

Cd to the "compose" directory and run

    docker-compose up 

or for detached mode  run

    docker-compose up -d --build  


####At this point, your Django app should be running at port 8000 on your Docker host. Go to http://localhost:8000 to check it