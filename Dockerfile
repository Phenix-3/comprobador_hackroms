FROM golang:alpine AS build
WORKDIR /app

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o bot-hackroms ./code

FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /app/bot-hackroms /bot-hackroms

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENTRYPOINT ["/bot-hackroms"]
