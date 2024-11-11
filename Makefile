# Makefile
.PHONY: dev staging prod clean

# Start development environment
dev:
	docker-compose up -d

# Stop development environment
stop:
	docker-compose down

# Clean up containers and unused Docker resources
clean:
	docker-compose down -v
	docker system prune -f

# View logs
logs:
	docker-compose logs -f

# Restart development environment
restart: stop dev

# Run tests
test:
	docker-compose exec nextjs npm test