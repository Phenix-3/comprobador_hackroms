FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o bot-hackroms ./code

FROM scratch
COPY --from=build /app/bot-hackroms /bot-hackroms
ENTRYPOINT ["/bot-hackroms"]
