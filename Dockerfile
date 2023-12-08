FROM --platform=amd64 node:alpine
RUN apk --no-cache add curl
WORKDIR /app
COPY ./ ./


WORKDIR /app/backend
RUN npm install
WORKDIR /app/ui
RUN npm install

# Create a group and user
RUN addgroup -g 1410 hiring

RUN adduser -D -u 1410 hiring -G hiring

RUN chown -R hiring:hiring /app

WORKDIR /app
RUN chown root:root flag.txt
RUN chmod 777 flag.txt


USER hiring

ENTRYPOINT ["/bin/sh", "/app/start.sh"]
