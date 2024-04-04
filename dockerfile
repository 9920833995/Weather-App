#select base images for hosting
FROM httpd:2.4

#adding user
RUN useradd -m appuser
USER appuser

#adding health check
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

#selecting current working directory
WORKDIR /usr/local/apache2/htdocs/

#removing the current html file
RUN rm -rf index.html

#transfering our data in docker env
COPY . .
