# StudyBuddy Spring microservice architecture backend
## Build & Run
Using `docker` and `minikube`:  
```shell
$ minikube start
$ eval $(minikube docker-env)
$ python3 builder.py
$ minikube kubectl -- apply -f deployment.kubernetes.yml
$ minikube kubectl -- port-forward svc/gateway-web 8080:8080
```
