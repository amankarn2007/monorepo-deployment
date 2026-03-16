FROM oven/bun:1 AS base

#ye container me space banalega apna
WORKDIR /usr/src/app

#Pehle sirf zaroori structure copy hoga(Dependencies ke liye)
COPY package.json bun.lock ./
COPY turbo.json ./

#packages ke package.json copy karna zaroori hai for workspace linking
COPY packages/db/package.json ./packages/db/

COPY apps/websocket/package.json ./apps/websocket/

RUN bun install

# this will copy prisma schemas and ts files
COPY . .

# generate db client
RUN bun db:generate

EXPOSE 8081

#app/backend ko start krna hai
WORKDIR /usr/src/app/apps/websocket
CMD [ "bun", "run", "dev" ]