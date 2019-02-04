# KuberHelms -- This project is similar docker_project where the deployment is done using HELM, the Kubernetes package manager.
1) Dockerfile - builds the source code using maven, runs the application on port 2123(locally)
2)Run_Helm.sh:
  2.1) logs into the docker and pushes the images
  2.2) logs into the IBMcloud, pull the image and deploy into the cluster using helm
  2.3) If the deployment with name "helmsample" is not available, a new deployment is created with "latest"(this is tag name)     image tag
  2.4) If the deployment with name "helmsample" already exists, the existing deployment is updated with the source code change
3) Application is accesible on http://hostname:31026/status
