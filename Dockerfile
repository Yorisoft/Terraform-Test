#pull from hashicorp provided containers
FROM hashicorp/terraform:light

#create working directory
WORKDIR /usr/src/terraform

#copying ALL  ->  WORKDIR
COPY . .

RUN apk update && apk add git && apk add tree
