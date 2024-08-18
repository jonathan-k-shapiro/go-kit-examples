FROM golang:alpine AS build-env
WORKDIR /usr/src
COPY . .
RUN mkdir out
RUN go build -o out/profilesvc ./profilesvc/cmd/profilesvc/ 

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /usr/src/out/profilesvc /app/
ENTRYPOINT ["/app/profilesvc"] 