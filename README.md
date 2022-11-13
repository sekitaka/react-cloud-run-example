This repository is an example to run react app on Cloud Run.

# Create a GCP Project and a Cloud Run service
1. Create GCP project
2. Enable Cloud Run 
3. Create Cloud Run service
4. Choose your container image url
5. Submit to create Cloud Run Service
6. Deploy container image (According to follow way.)

# Create Artifact Registry for container image
1. Enable Artifact Registry 
2. Create GCR.io Repository.
   The repository url likes this `gcr.io/api-6819121969308683875-7979/gcr.io`
3. Deploy container image

# How to deploy container image
```
# Build react on your local machine
cd PROJECT_ROOT
npm run build

# Once
gcloud auth configure-docker

# If you need login
gcloud auth login

# Build container image including react app built
## Build image on Intel Mac
docker build -f docker_cloudrun/Dockerfile --tag gcr.io/api-6819121969308683875-7979/gcr.io/reactcloudrun:latest .
docker push gcr.io/api-6819121969308683875-7979/gcr.io/reactcloudrun:latest

## Build image and push it to registry directry on M1
docker buildx build --no-cache --push --platform=linux/amd64 -f docker_cloudrun/Dockerfile --tag gcr.io/api-6819121969308683875-7979/gcr.io/reactcloudrun:latest .

# References
https://everythingdevops.dev/building-x86-images-on-an-apple-m1-chip/
https://stackoverflow.com/questions/64403659/docker-buildx-image-not-showing-in-docker-image-ls
```


# Trouble Shooting
## Port error
Cloud Run console shows this error.
```
The user-provided container failed to start and listen on the port defined provided by the PORT=8080 environment variable. Logs for this revision might contain more information.
```
Container log is here.
```
terminated: Application failed to start: Failed to create init process: failed to load /docker-entrypoint.sh: exec format error
```

The reason is that I build container image on M1 Mac, But Cloud Run environment is not amd64. I had to specify architecture. 

