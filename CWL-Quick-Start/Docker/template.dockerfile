# Build from base image
# FROM ubuntu:latest
FROM ubuntu:latest


# Update base images with latest patches
# RUN apt-get update -y && apt-get upgrade -y
RUN <COMMAND>

# Install dependencies
# RUN apt-get install -y \
		# python-pip

# Install tool
# RUN pip install wordcloud
RUN <COMMAND>

# Set entrypoint
# ENTRYPOINT [ "wordcloud_cli.py" ]
