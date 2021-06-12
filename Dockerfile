# Kernel image
FROM python:3.8-alpine3.12
# Select workdir
WORKDIR /app
# Copy folder to image
COPY ./app .
# Install system dependencies
RUN apk add postgresql-client && \
    apk add build-base
# Create a working directory.
RUN mkdir deployment
# Install VirtualEnv.
RUN pip install virtualenv
# Add requirements file.
ADD requirements.txt /deployment/requirements.txt
# Run VirtualEnv.
RUN virtualenv /deployment/env/
# Install dependencies
RUN /deployment/env/bin/pip install -r /deployment/requirements.txt
# Port
EXPOSE 5000
# Run app
CMD [ "python", "app.py" ]
