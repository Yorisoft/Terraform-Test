#pull from hashicorp provided containers
FROM hashicorp/terraform

#create working directory
WORKDIR /usr/src/terraform

#copying ALL  ->  WORKDIR
COPY . .

ENV AWS_ACCESS_KEY_ID=AKIAWIB3TCSMK56ZSY6E \
    AWS_SECRET_ACCESS_KEY=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 \
    OKTA_API_TOKEN=00x_rGO-dbWOrowQkDoDSeIrxAgNKBWaAuclZzpQFQ


#
RUN terraform init && \
	terraform plan && \
	terraform apply -auto-approve && \
    terraform show

