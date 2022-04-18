FROM alpine
RUN apk update && apk upgrade && \
  apk add --no-cache ca-certificates
RUN ls
COPY stripe /bin/stripe
ENTRYPOINT ["/bin/stripe"]
