FROM golang:alpine
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...

CMD ["go", "run", "main.go"]