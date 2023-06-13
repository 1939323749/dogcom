FROM alpine:latest
RUN apk add --no-cache gcc make musl-dev linux-headers
WORKDIR /app
COPY . .
RUN make
CMD ["./dogcom", "-m", "dhcp", "-c", "d.conf"]