# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

RUN curl -s https://raw.githubusercontent.com/objectbox/objectbox-dart/main/install.sh -o install.sh && \
    bash install.sh && \
    rm install.sh

RUN mkdir -p /usr/lib && \
    cp ./lib/libobjectbox2.so /usr/lib/

ENV LD_LIBRARY_PATH="/usr/lib"
    
# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe lib/server.dart -o lib/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/lib/server /app/lib/

# Start server.
EXPOSE 8080
CMD ["/app/lib/server"]
