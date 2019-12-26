run:
	docker-compose -f service/docker-compose.yml up -d
	
down:
	docker-compose -f service/docker-compose.yml down

build:
	docker-compose -f service/docker-compose.yml up --build -d