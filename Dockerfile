# Etapa 1: build (instala dependencias y empaqueta con esbuild)
FROM public.ecr.aws/lambda/nodejs:22 AS build
WORKDIR /build
COPY package.json package-lock.json ./
RUN npm ci
COPY src/ ./src/
RUN npm run build

# Etapa 2: final (solo el artefacto empaquetado)
FROM public.ecr.aws/lambda/nodejs:22
COPY --from=build /build/dist/handler.js ${LAMBDA_TASK_ROOT}/
CMD ["handler.handler"]
