FROM swift:5.9

COPY . /App
WORKDIR /App

RUN swift build -c release
RUN cp .build/release/mobileprovision /usr/bin/

ENTRYPOINT [ "mobileprovision" ]
