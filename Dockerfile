FROM golang:alpine as builder
WORKDIR /app

COPY . .

RUN go build -ldflags "-s -w" -o myapp

FROM scratch

WORKDIR /app

COPY --from=builder /app/myapp .

EXPOSE 8080

CMD ["./myapp"]