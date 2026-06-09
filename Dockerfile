# --- build ---
FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY cmd/ ./cmd/
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o server ./cmd/server

# --- runtime ---
FROM gcr.io/distroless/static:nonroot AS runtime

WORKDIR /app

COPY --from=builder /app/server ./server

EXPOSE 8080

ENTRYPOINT ["/app/server"]
