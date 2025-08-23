FROM node:20-alpine AS deps

ARG GIT_BRANCH
RUN if [ "$GIT_BRANCH" != "main" ]; then \
      echo "⚠️  Build is allowed only from the main branch, current: $GIT_BRANCH"; \
      exit 1; \
    fi

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --legacy-peer-deps

FROM node:20-alpine AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules

COPY . .
ENV NODE_ENV=production
RUN npm run build

FROM nginx:alpine AS runner

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
