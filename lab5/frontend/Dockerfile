FROM node:18.6.0-alpine AS build
WORKDIR /frontend

COPY package.json package-lock.json ./

RUN npm ci --production && npm cache clean --force

COPY . .

RUN npm run build

FROM node:18.6.0-alpine AS final
WORKDIR /frontend

COPY --from=build /frontend /frontend

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE $PORT

CMD ["npm", "start"]