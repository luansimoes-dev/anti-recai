.PHONY: help up down \
        build build-backend build-frontend \
        run run-backend run-frontend \
        test test-backend test-frontend \
        check check-backend check-frontend

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  up               Sobe o Docker Compose"
	@echo "  down             Derruba o Docker Compose"
	@echo ""
	@echo "  build            Build de tudo"
	@echo "  build-backend    mvnw package (sem testes)"
	@echo "  build-frontend   pnpm build"
	@echo ""
	@echo "  run              Roda backend e frontend juntos (Ctrl+C encerra ambos)"
	@echo "  run-backend      Spring Boot dev"
	@echo "  run-frontend     Next.js dev"
	@echo ""
	@echo "  test             Testa tudo"
	@echo "  test-backend     mvnw test"
	@echo "  test-frontend    typecheck + lint"
	@echo ""
	@echo "  check            Valida tudo sem compilar"
	@echo "  check-backend    mvnw validate"
	@echo "  check-frontend   typecheck + lint"

DOCKER_COMPOSE = docker compose -f docker/docker-compose.yml

# ── Docker ────────────────────────────────────────────────────────────────────
up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

# ── Build ─────────────────────────────────────────────────────────────────────
build: build-backend build-frontend

build-backend:
	cd backend && ./mvnw package -DskipTests

build-frontend:
	cd frontend && pnpm build

# ── Run (dev) ─────────────────────────────────────────────────────────────────
run: 
	trap 'kill 0' SIGINT; \
	(cd backend && ./mvnw spring-boot:run) & \
	(cd frontend && pnpm dev) & \
	wait

run-backend:
	cd backend && ./mvnw spring-boot:run

run-frontend:
	cd frontend && pnpm dev

# ── Test ──────────────────────────────────────────────────────────────────────
test: test-backend test-frontend

test-backend:
	cd backend && ./mvnw test

test-frontend:
	cd frontend && pnpm typecheck && pnpm lint

# ── Check (lint / typecheck only, sem compilar) ───────────────────────────────
check: check-backend check-frontend

check-backend:
	cd backend && ./mvnw validate

check-frontend:
	cd frontend && pnpm typecheck && pnpm lint

init:
	echo 'POSTGRES_USER=root' >> .env
	echo 'POSTGRES_PASSWORD=postgress' >> .env
	echo 'POSTGRES_DB=db' >> .env
