FROM python:3.9
ENV PYTHONUNBUFFERED 1

# Create a directory for the app
RUN mkdir /code
WORKDIR /code

# Copy the requirements file and install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the code to the container
COPY ./chatbox/ /code/
#COPY ./chatbox.crt /code/
#COPY ./chatbox.key /code/

# Run migrations and collectstatic
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py collectstatic --noinput 