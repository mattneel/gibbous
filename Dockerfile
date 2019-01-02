FROM elixir:1.7.4-alpine
LABEL maintainer="Matt Neel <requisite.zero@gmail.com>"

RUN apk update && apk add inotify-tools postgresql-dev

WORKDIR /app

COPY mix* ./
RUN mix local.hex --force && mix local.rebar --force \
  && mix deps.get && mix deps.compile && mix phx.gen.cert

COPY . .

EXPOSE 4000
EXPOSE 8000
HEALTHCHECK CMD wget -q -O /dev/null http://localhost:4000/healthy || exit 1

CMD ["mix", "phx.server"]