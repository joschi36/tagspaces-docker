FROM httpd:2-alpine

ARG TAGSPACES_VERSION

RUN apk update && apk add --no-cache bash wget unzip apr-util-dbm_db

RUN wget https://github.com/tagspaces/tagspaces/releases/download/${TAGSPACES_VERSION}/tagspaces-web.zip \
  && unzip tagspaces-web.zip \
  && rm -rf /usr/local/apache2/htdocs \
  && mv web /usr/local/apache2/htdocs \
  && rm -rf tagspaces-web.zip

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

RUN htpasswd -b -c /webdav.password webdav webdav \
  && mkdir /usr/local/apache2/var \
  && chown -R www-data:www-data /usr/local/apache2/htdocs \
  && chown -R daemon:daemon /usr/local/apache2/var

EXPOSE 80
