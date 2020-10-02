FROM 0x01be/pegasus:build as build

FROM 0x01be/xpra

COPY --from=build /opt/pegasus-frontend/ /opt/pegasus-frontend/

USER root

RUN apk --no-cache add --virtual pegasus-runtime-dependencies \
    qt5-qtbase \
    qt5-qtbase-x11 \
    qt5-qtmultimedia \
    qt5-qtsvg \
    qt5-qtquickcontrols2 \
    qt5-qtgamepad \
    sdl2 \
    sqlite

USER xpra

ENV PATH ${PATH}:/opt/pegasus-frontend/
ENV COMMAND "pegasus-fe"

