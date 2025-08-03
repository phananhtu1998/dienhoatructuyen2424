# Bước 1: Build
FROM golang:alpine AS builder
WORKDIR /build
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o crm.gobackend.com ./cmd/server
RUN apk add --no-cache ca-certificates

# Bước 2: Đóng gói vào scratch
FROM scratch
WORKDIR /root/

# Copy binary & certs
COPY --from=builder /build/crm.gobackend.com /
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY ./config /root/config
COPY ./template-email /root/template-email

ENTRYPOINT ["/crm.gobackend.com", "config/local.config"]