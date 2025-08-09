FROM node:20-alpine AS base
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --production=false
COPY . .

# Build the Astro site
RUN npm run build

# Production image
FROM node:20-alpine AS prod
WORKDIR /app
COPY --from=base /app .
ENV NODE_ENV=production
EXPOSE 4321
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]