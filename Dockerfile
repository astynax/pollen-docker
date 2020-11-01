FROM debian:sid-20201012

RUN apt-get update && \
    apt-get install -y \
    racket wget

RUN wget https://mkcert.org/generate/ -o /etc/ssl/certs/ca-bundle.pem
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.pem

RUN raco pkg install \
    --no-docs --no-trash --batch \
    --deps search-auto --installation \
    pollen

WORKDIR /work

ENTRYPOINT ["raco", "pollen"]

CMD ["test"]
