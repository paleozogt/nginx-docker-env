# Dockerfile to create nginx image that can be configured by env vars at runtime
# from https://serverfault.com/a/919212/60385

FROM nginx

ENV PORT=80 
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.tmpl && \
    sed -i 's/80;/${PORT};/g' /etc/nginx/conf.d/default.conf.tmpl

ADD nginx-start.sh /bin/nginx-start.sh
ENTRYPOINT ["/bin/nginx-start.sh"]
CMD ["nginx", "-g", "daemon off;"]
