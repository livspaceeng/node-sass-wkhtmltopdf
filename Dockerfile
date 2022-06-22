FROM aantonw/alpine-wkhtmltopdf-patched-qt:latest as aantonw
FROM jaimingandhi/docker-node-sass-alpine:v1

RUN apk add --update --no-cache bash \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

RUN apk add --update --no-cache bash \
    libcrypto1.1 libssl1.1 \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ --allow-untrusted

COPY --from=aantonw /lib/libwkhtmltox.so.0.12.5 /lib
COPY --from=aantonw /bin/wkhtmltopdf /bin

RUN chmod +x /bin/wkhtmltopdf
