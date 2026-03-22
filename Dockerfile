# ---------- BUILD STAGE ----------
FROM node:20-alpine AS builder

# Upgrade alpine packages to patch base image vulnerabilities
RUN apk update && apk upgrade --no-cache

WORKDIR /app

# Install deps first (better layer caching)
COPY package*.json ./
RUN npm ci

# Copy source
COPY . .

# Build production bundle
RUN npm run build


# ---------- PRODUCTION STAGE ----------
FROM nginx:alpine

# Upgrade alpine packages to patch base image vulnerabilities
RUN apk update && apk upgrade --no-cache

# Remove default nginx config
RUN rm -rf /usr/share/nginx/html/*

# Copy built app
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx config (important for SPA routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]