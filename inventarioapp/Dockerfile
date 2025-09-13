FROM instrumentisto/flutter:latest AS build

WORKDIR /app

COPY pubspec.yaml .
RUN flutter pub get

COPY . .

RUN flutter clean
RUN flutter build apk --split-per-abi

FROM scratch AS export-stage

COPY --from=build /app/build/app/outputs/flutter-apk /

CMD ["/"]