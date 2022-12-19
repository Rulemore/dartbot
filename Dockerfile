FROM dart

RUN mkdir -p /usr/bin/app

WORKDIR /usr/bin/app

COPY . /usr/bin/app

RUN dart pub get

CMD ["dart", "run"]
