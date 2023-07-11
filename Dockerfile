FROM alpine:latest AS builder
RUN apk add --no-cache gcc make musl-dev linux-headers
WORKDIR /app
COPY . .
RUN make

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/dogcom .
COPY --from=builder /app/d.conf .
CMD ["./dogcom", "-m", "dhcp", "-c", "d.conf"]