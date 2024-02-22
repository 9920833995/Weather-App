#select base images for hosting
FROM httpd:2.4

#adding user as per best practice
RUN useradd -m appuser
USER appuser

#selecting current working directory
WORKDIR /usr/local/apache2/htdocs/

#removing the current html file
RUN rm -rf index.html

#health check of container
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

#transfering our data in docker env
COPY . .
