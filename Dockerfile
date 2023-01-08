FROM python:3.8
ARG ACCESS_KEY_ID
ARG SECRET_ACCESS_KEY
RUN pip install pip  --upgrade
RUN apt-get update && apt-get install -y \
    python3  \
    python3 awscli
RUN aws configure set aws_access_key_id $ACCESS_KEY_ID \
    && aws configure set aws_secret_access_key $SECRET_ACCESS_KEY \
    && aws configure set default.region ap-south-1 \
    && aws configure set default.output json
COPY ./script.sh .
RUN chmod 777 script.sh
CMD ./script.sh
