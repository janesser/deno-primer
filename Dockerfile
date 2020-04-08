# docker build . -t deno-hello-world
# docker run --name deno-hello-world --rm -d -P deno-hello-world
# docker stop deno-hello-world
FROM hayd/alpine-deno:0.36.0

EXPOSE 8000

WORKDIR /app

ENV DENO_DIR /app

# Cache the dependencies as a layer (this is re-run only when deps.ts is modified).
# Ideally this will download and compile _all_ external files used in main.ts.
COPY hello-world.ts /app
RUN deno fetch hello-world.ts

# Prefer not to run as root.
USER deno

# These are passed as deno arguments when run with docker:
CMD ["--allow-net", "hello-world.ts"]