build-docker:
	docker build -t sodiadrhain/nginx .

run-docker:
	docker run -p 8080:80 --name sodiadrhain-nginx -d sodiadrhain/nginx

remove-docker:
	docker image rm sodiadrhain/nginx

remove-container:
	docker container rm sodiadrhain-nginx -f

stop-container:
	docker container stop sodiadrhain-nginx

start-container:
	docker container start sodiadrhain-nginx

create-pod:
	kubectl create -f k8s/pod.yml

delete-pod:
	kubectl delete pod sodiadrhain-nginx-pod

create-service:
	kubectl create -f k8s/service.yml

delete-service:
	kubectl delete service sodiadrhain-nginx-service

start-k8s:
	kubectl port-forward sodiadrhain-nginx-pod 8080:80

.PHONY: build-docker run-docker remove-container stop-container start-container create-pod delete-pod create-service delete-service start-k8s