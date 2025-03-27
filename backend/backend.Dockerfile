FROM node:16 AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build || echo "Skipping build step"  # This avoids errors if there's no "build" script


FROM node:16
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3001
CMD ["npm", "start"]