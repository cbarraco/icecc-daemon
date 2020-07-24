all: docker-push

.PHONY: docker-build
docker-build:
	docker build -t cbarraco/icecc-daemon:latest .

.PHONY: docker-push
docker-push: docker-build
	docker push cbarraco/icecc-daemon:latest
