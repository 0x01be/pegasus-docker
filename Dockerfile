FROM alpine

RUN apk --no-cache add --virtual pegasus-build-dependencies \
    git \
    build-base \
    qt5-qtbase-dev \
    qt5-qtbase-x11 \
    qt5-qttools-dev \
    qt5-qtmultimedia-dev \
    qt5-qtsvg-dev \
    qt5-qtquickcontrols2-dev \
    qt5-qtgamepad-dev \
    sdl2-dev \
    sqlite-dev

ENV PEGASUS_REVISION master
RUN git clone --recursive --branch ${PEGASUS_REVISION} https://github.com/mmatyas/pegasus-frontend.git /pegasus

WORKDIR /pegasus/build

RUN qmake-qt5 -set prefix /opt/pegasus
RUN qmake-qt5 ..
RUN make
RUN make install

