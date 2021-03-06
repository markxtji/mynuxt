FROM amazeeio/node:8-builder as builder
COPY package.json package-lock.json /app/
RUN npm install

FROM amazeeio/node:8
COPY --from=builder /app/node_modules /app/node_modules
COPY . /app/


ENV HOST 0.0.0.0
EXPOSE 3000


CMD ["npm", "run", "dev"]
