FROM golang:alpine
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go build -o main .

FROM alpine:latest
WORKDIR /app
COPY --from=0 /go/src/app/main /app/main
COPY ./gpt4_bot_config.yml /app/gpt4_bot_config.yml

CMD ["./main"]