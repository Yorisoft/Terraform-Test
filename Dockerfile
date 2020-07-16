#pull from hashicorp provided containers
FROM hashicorp/terraform

#create working directory
WORKDIR /usr/src/terraform

#copying ALL  ->  WORKDIR
COPY . .

#set up environment variablesss
ENV OKTA_API_TOKEN=

#
RUN terraform init && \
	terraform import okta_app_oauth.example 0oahjv3ni5cUh53kx4x6 && \
	terraform plan && \
	terraform apply -auto-approve

