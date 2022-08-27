
# Stage 1
FROM golang:1.19-alpine3.16 AS build-env
WORKDIR /app
ADD /app /app
RUN go build -o desafio main.go

# Stage finale
FROM scratch
WORKDIR /app
COPY --from=build-env /app/desafio /app
ENTRYPOINT ["./desafio"]