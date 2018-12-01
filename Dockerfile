FROM elixir:1.7.4

WORKDIR /app

COPY . /app

#RUN mix local.hex --force
#RUN mix local.rebar --force
#RUN mix deps.get

EXPOSE 80

ENV MIX_ENV=prod

CMD mix local.hex --force && mix local.rebar --force && mix deps.get && mix run --no-halt