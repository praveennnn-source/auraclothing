# Aura Clothing — demo storefront
# Serves the single-file HTML demo as a static site via Nginx.

FROM nginx:1.27-alpine

# Nginx's default site serves everything in this folder on port 80
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
