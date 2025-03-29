# Variables
COMPOSE = docker-compose
DOCKER = docker
APP_CONTAINER = django_app

# Start the application
up:
	$(COMPOSE) up --build -d

# Stop all containers
down:
	$(COMPOSE) down

# Restart the application
restart:
	$(MAKE) down
	$(MAKE) up

# Show running containers
ps:
	$(DOCKER) ps

# Run migrations
migrate:
	$(DOCKER) exec -it $(APP_CONTAINER) python manage.py migrate

# Create a superuser
createsuperuser:
	$(DOCKER) exec -it $(APP_CONTAINER) python manage.py createsuperuser

# Show logs of all containers
logs:
	$(COMPOSE) logs -f

# Show logs of the Django app only
logs-app:
	$(DOCKER) logs -f $(APP_CONTAINER)

# Run bash in the Django container
shell:
	$(DOCKER) exec -it $(APP_CONTAINER) bash

# Run Django shell
django-shell:
	$(DOCKER) exec -it $(APP_CONTAINER) python manage.py shell

# Clear Docker cache and rebuild
rebuild:
	$(COMPOSE) build --no-cache

# Restart Celery worker
restart-celery:
	$(DOCKER) restart celery_worker

# Check Celery worker logs
logs-celery:
	$(DOCKER) logs -f celery_worker

# Display help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  up               Start the application (Docker Compose)"
	@echo "  down             Stop all containers"
	@echo "  restart          Restart the application"
	@echo "  ps               Show running containers"
	@echo "  migrate          Run Django migrations"
	@echo "  createsuperuser  Create a Django superuser"
	@echo "  logs             Show logs of all containers"
	@echo "  logs-app         Show logs of the Django app"
	@echo "  shell            Open a shell in the Django container"
	@echo "  django-shell     Open Django shell"
	@echo "  rebuild          Re
