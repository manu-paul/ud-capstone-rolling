
# Udaity Devops Capstone Project
This project demonstrates the automated deployment of a simple HTML file application into AWS EKS cluster based on rolling deployment strategy. 
The index.html file is running on nginx and that shows the message "Hello World, my name is Manu Paul" to the end user.

## Infrastructure
This application requires/utilizes the following infrastructure.
1. Github for source control
2. AWS EC2 instance for Jenkins pipeline with Blue Ocean and AWS plug-ins
3. AWS EC2 instance for Docker build
4. Docker Hub registry to store the docker app image
5. AWS EKS cluster

### Amazon Elastic Kubernetes Service (Amazon EKS) has been created using below command:
<i>eksctl create cluster --name capstone --version 1.17 --nodegroup-name standard-workers --node-type t2.micro --nodes 3 --nodes-min 1 --nodes-max 4 --node-ami auto --region us-west-2</i>
<br>
** create_eks.sh can be executed for this purpose.<br>
** AWS EC2 instance was provisioned manually for Jenkins and Docker setup<br>
** AWS EKS internally uses CloudFormation and setup the entire infrastructure automatically 

## Deployment - Jenkins Pipeline Build and Deployment Steps - Rolling Update
1. Lint the code
2. Build a Docker image based off of my Dockerfile
3. Upload the container to the Docker Registry
4. Create the Kubernetes configuration file
5. Deploy the application to my AWS EKS cluster

** the file 'eks-deploy.yml' specifies the deployment strategy as RollingUpdate

## Screen shots 
### Rolling Update (/rolling/screenshots)
1. running_app.png - screenshot of the final web-app.
2. jenkins_lint_failed.png - Jenkins pipeline Linting stage failed.
3. jenkins_sucess.png - Jenkins pipeline sucess
4. jenkins_sucess.png - Jenkins pipeline sucess
5. docker_hub.png - Docker image in registry
6. eks_cloud_formation.png	
7. eks_cluster.png - AWS-EKS Cluster
8. docker_kubectl_console.png	- Docker images, K8S service display, kubectl describe deployments

## App URL
http://a45318a8733394b979577304a6721dcf-1864717267.us-west-2.elb.amazonaws.com/

## App Files
	index.html - shows the message "Hello World, my name is Manu Paul" to the end user
## Dockerfiles
	Dockerfile - contains the Docker image steps
	run_docker.sh - run to build the Docker image
    upload_docker.sh - push docker image to docker hub
## Kubernetes files
	create_eks.sh - Can be run to create the AWS EKS cluster
	eks-deployment.yml - Contains the K8S app deployment and load balancer service details
## Jenkins 
	Jenkinsfile - Contains the Jenkins pipeline definition and steps
