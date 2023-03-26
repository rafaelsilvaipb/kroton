& minikube start
& kubectl delete regcred
& kubectl create secret docker-registry regcred --docker-server=661984127532.dkr.ecr.us-east-1.amazonaws.com --docker-username=aws --docker-password=$(aws ecr get-login-password) --docker-email=rafaelsilva.ipbaws@gmail.com
& kubectl apply -f .\ingress.yaml
& kubectl expose deployment kroton-deployment --type=NodePort
& minikube service kroton-deployment --url

-noexit
