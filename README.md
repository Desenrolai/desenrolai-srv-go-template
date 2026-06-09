# srv-go-template

GitHub Template — backend Go (net/http).

## Requisitos

- Go 1.22+

## Rodar localmente

```bash
go run ./cmd/server
# GET http://localhost:8080/health → {"status":"ok"}
```

## Build

```bash
go build -o server ./cmd/server
./server
```

## Docker

```bash
docker build -t srv-go-template .
docker run -p 8080:8080 srv-go-template
```

## CI

Push para `main` → build + vet + test + push GHCR.
