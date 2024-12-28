# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

RUN curl -s https://raw.githubusercontent.com/objectbox/objectbox-dart/main/install.sh -o install.sh && \
    bash install.sh && \
    rm install.sh

RUN apt-get update && apt-get install -y libstdc++6

RUN mkdir -p /usr/lib && \
    cp ./lib/libobjectbox.so /usr/lib/

ENV LD_LIBRARY_PATH="/usr/lib"
    
# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe lib/server.dart -o lib/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
# FROM debian:slim AS runtime
COPY --from=build /runtime/ /
COPY --from=build /app/lib/server /app/lib/
COPY --from=build /usr/lib/* /usr/lib/
# COPY --from=build /usr/lib/libobjectbox.so /usr/lib/
# COPY --from=build /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/

# Start server.
EXPOSE 8080
CMD ["/app/lib/server"]
