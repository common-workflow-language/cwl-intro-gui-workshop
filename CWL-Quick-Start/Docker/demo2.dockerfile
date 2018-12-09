# Build from base image
FROM ubuntu:latest
# Update base images with latest patches
RUN apt-get update && apt-get upgrade -y
# Install dependencies and pdftotext
RUN apt-get install -y \
  poppler-utils \
  # python-pip

# Install tool
# RUN pip install wordcloud
