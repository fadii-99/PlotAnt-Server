from pathlib import Path
from datetime import timedelta
import os
from django.conf import settings

BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = 'django-insecure-hqkaaibwli!6)ui4b#0+d70lkojvk*(#cn*tvtf@)c1+34m-(9'

DEBUG = True

# settings.SESSION_COOKIE_SAMESITE = 'Lax'
# settings.CSRF_COOKIE_SAMESITE = 'Lax'
# settings.SESSION_COOKIE_SECURE = False  # Ensure cookies are sent only over HTTPS
# settings.CSRF_COOKIE_SECURE = False

ALLOWED_HOSTS = ["*"]

INSTALLED_APPS = [
    'django_crontab',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'accounts',
    'project',
    'rest_framework',
    'corsheaders',
    'django_celery_beat',
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
]

SOCIALACCOUNT_PROVIDERS = {

    'github': {

        'APP': 'github',

        'APP_ID': 'Ov23lilF0qPJ7JAM1eAb',
        # 'APP_ID': 'Ov23liBkXmFWUdVymPlS',

        # 'APP_SECRET': '5d86a6c15ab77618457b1db3381e04b9811d5b75',
        'APP_SECRET': 'dd6a74700502647f141349fea1c44fded976f7d7',

        'AUTH_PARAMS': {'scope': 'read:user'},

    }

}


AUTHENTICATION_BACKENDS = (

    'allauth.account.auth_backends.AuthenticationBackend',

)


LOGIN_REDIRECT_URL = '/'


DEBUG = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'fawdmuhammad14@gmail.com'
EMAIL_HOST_PASSWORD = 'vxzxanmeiemaougl'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'


SESSION_ENGINE = 'django.contrib.sessions.backends.db'  


# CORS_ALLOWED_ORIGINS = ["http://64.227.180.23:8800"]
CORS_ALLOWED_ORIGINS = [
    "http://plotant.com",
]

CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_ALL_ORIGINS = True
# Optional settings for methods and headers if needed
CORS_ALLOW_METHODS = [
    "DELETE",
    "GET",
    "OPTIONS",
    "PATCH",
    "POST",
    "PUT",
]

CORS_ALLOW_HEADERS = [
    "accept",
    "accept-encoding",
    "authorization",
    "content-type",
    "dnt",
    "origin",
    "user-agent",
    "x-csrftoken",
    "x-requested-with",
]
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'allauth.account.middleware.AccountMiddleware',  
]

ROOT_URLCONF = 'server.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR,"templates"],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'server.wsgi.application'


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
        #'ENGINE': 'django.db.backends.mysql',
        # 'ENGINE': 'mysql.connector.django',
        # 'NAME': 'plotant',
        # 'USER': 'root',
        # 'PASSWORD': '',
        # 'host':'localhost',
        # 'PORT':'3306',
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Karachi'

USE_I18N = True

USE_TZ = False


STATIC_URL = 'static/'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.TokenAuthentication',
    ],
}


CELERY_BROKER_URL = 'redis://localhost:6379/0'
CELERY_RESULT_BACKEND = 'redis://localhost:6379/0'
CELERY_BEAT_SCHEDULE = {
    'print-hello-every-2-seconds': {
        'task': 'project.tasks.delete_old_files',
        'schedule': timedelta(days=7),  
    },
}
