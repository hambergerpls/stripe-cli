FROM golang:1.17.1 as builder

WORKDIR /go/src/github.com/stripe/stripe-cli/

COPY . .

RUN make setup

RUN make build

FROM alpine

RUN apk update && apk upgrade && \
  apk add --no-cache ca-certificates

COPY --from=builder /go/src/github.com/stripe/stripe-cli/stripe /bin/stripe
ENTRYPOINT ["/bin/stripe"]
