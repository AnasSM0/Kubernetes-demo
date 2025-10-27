set -e

NAME="kubernetes-demo-api"
UserNAME="anassm0"
IMAGE="$UserNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "fetching the main service..."
kubectl get services $NAME

echo "Deployment complete."
