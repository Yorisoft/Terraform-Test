#pull from hashicorp provided containers
FROM hashicorp/terraform

#create working directory
WORKDIR /usr/src/terraform

#copying ALL  ->  WORKDIR
COPY . .

#set up environment variables
ENV OKTA_API_TOKEN=

#
RUN terraform init && \
	terraform plan && \
	terraform apply -auto-approve

