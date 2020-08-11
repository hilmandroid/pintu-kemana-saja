# pintu-kemana-saja

## Build Docker Images
```bash
cd backend
docker build . -t trivia-backend:1.0
docker image tag trivia-backend:1.0 docker.io/hilmandroid/trivia-backend:1.0
docker push docker.io/hilmandroid/trivia-backend:1.0
cd ../frontend
docker build . -t trivia-frontend:1.0
docker image tag trivia-frontend:1.0 docker.io/hilmandroid/trivia-frontend:1.0
docker push docker.io/hilmandroid/trivia-frontend:1.0
```

## Deploy EKS Cluster on AWS with AWS ALB Ingress Controller
### Deploy EKS Cluster with Terraform
```bash
git clone https://github.com/terraform-aws-modules/terraform-aws-eks.git
cd terraform-aws-eks/examples/basic
terraform init
terraform apply
```
### Update Kube Config
```bash
# check eks cluster name
aws eks list-clusters --region us-west-2
# update kubeconfig
aws eks update-kubeconfig --region --name $EKS_CLUSTER_NAME --region us-west-2
```
### Install AWS ALB Ingress Controller
1. Create IAM Policy
```bash
# create iam policy
aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document file://alb-ingress-controller/alb-ingress-policy-iam-policy.json
```
2. Create IAM User with policy that created from #1
3. Note down Access key ID and Secret access key
4. Modify alb-ingress-controller/alb-ingress-controller.yaml file and fill the value for AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY with value from #4
5. Modify container arguments (cluster-name) for alb-ingress-controller with correct cluster name
6. apply alb-ingress-controller.yaml
   ```bash
   kubectl apply -f alb-ingress-controller/alb-ingress-controller.yaml
   ```
    

