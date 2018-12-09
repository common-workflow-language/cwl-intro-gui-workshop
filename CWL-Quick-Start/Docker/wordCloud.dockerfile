# Build from base image
FROM ubuntu:latest

# Update base images with latest patches
RUN apt-get update -y && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y \
		python-pip

# Install tool
RUN pip install wordcloud

ENTRYPOINT [ "wordcloud_cli.py" ]
