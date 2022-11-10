This repository is an example to run react app on Cloud Run.

# Create GCP Project
1. Create GCP project
2. Enable Cloud Run 
3. Create Cloud Run service
4. Choose your container image url
5. Submit to create Cloud RUn Service

## Artifact Registry
4. Enable Artifact Registry
5. Create GCR.io Repository


us-docker.pkg.dev/YOUR_ID/gcr.io
gcr.io/YOUR_ID

# How to deploy container

```
npm build
cd PROJECT_ROOT

# Build
docker build  -f docker_cloudrun/Dockerfile --tag gcr.io/YOUR_ID/gcr.io/reactcloudrun:latest .
# Build (on M1)
docker buildx build --platform linux/arm64 -f docker_cloudrun/Dockerfile --tag gcr.io/YOUR_ID/gcr.io/reactcloudrun:latest .


# Once
gcloud auth configure-docker

docker push gcr.io/YOUR_ID/gcr.io/reactcloudrun:latest 

# If you need login
gcloud auth login
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

-----------------------------------



# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
