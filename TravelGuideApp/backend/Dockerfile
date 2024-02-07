FROM python:3.9.18

# Set the working directory in the container
WORKDIR /code
# Copy the Python dependencies file
COPY requirements.txt /code

# Install the Python dependencies
RUN pip3 install -r requirements.txt

# Copy the entire current directory contents into the container
COPY . /code

ENV FLASK_APP app.py
ENV FLASK_ENV development
ENV FLASK_RUN_PORT 5000
ENV FLASK_RUN_HOST 0.0.0.0

# Expose the port Flask runs on
EXPOSE 5000

CMD ["flask", "run"]