& minikube start
& kubectl apply -f .\ingress.yaml
& kubectl expose deployment kroton-deployment --type=NodePort
& minikube service kroton-deployment