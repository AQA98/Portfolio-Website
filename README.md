The app is dockerized and is running on kubernetes cluster [http://212.2.247.147/].
CI/CD is created using github actions which will dockerize the application and push it to the remote repository, Where kubernetes deployment picks that new image [on every merge to the main branch] and deploys it to the cluster.
