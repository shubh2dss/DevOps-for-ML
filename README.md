# DevOps-for-ML

## Architecture

![Architecture](Readme%20Content/ML%20Prediction%20Flow.png)

## Code Files:

<ins>CI_and_CD/src/inference.py</ins>:

•	Reading the Input Json data and transform it into prediction sample.

•	Load the Pickled Model file and predict for Input data

•	Jsonify the predictions and return the response.

•	Wrap this Model Prediction code in a Flask API and expose the endpoint.

<ins>Dockerfile</ins>:  Our Flask API will run inside this Docker Container.

•	Using Base Image as continuumio/anaconda3:4.4.0

•	Install required Ubuntu packages

•	Set the Working Directory

•	Copy the required Code Files.

•	Install the dependent python Packages.

•	Run the Flask API to serve the Model

<ins>Jenkinsfile</ins>: Contains Code to build Docker Image and run Docker Container to server Model as an API.

•	Pretty much the steps explained below in [ML Prediction Pipeline Steps](https://github.com/shubh2ds/DevOps-for-ML#ml-prediction-pipeline-steps).


Whenever developer checks-in code to github and pull request is approved to merge code to Master branch then the Jenkins ML Prediction Pipeline will be triggered.

## Prerequisites for ML Prediction Pipeline:

•	Create Web Hook in Github to Trigger the Jenkins Pipeline Job

    Go to Project/Settings/Webhooks in Github
    Refer the Screen shot below
   
![Github WebHook](Readme%20Content/GitHub_WebHook_Configuration.png)

•	Configure the Pipeline to trigger on Github's request.

    select option as shown in below screenshot.

![Jenkins WebHook](Readme%20Content/Jenkins_WebHook_Configuration.png)

## ML Prediction Pipeline Steps:

1.	Clean the workspace.

2.	Pull the ML Prediction code to Jenkins Workspace from Github.

3.	Build the Docker image using the Dockerfile.

4.	Tag the local Docker Image to Docker Hub Repository (I Choose to have Jenkins Build Number as Docker Repository Image Tag).

5.	Push the local Docker Image to Docker Hub Repository.

6.	Using SSH execute the below commands in Prod/QA server.

    (a)	Pull the ML Prediction Docker Image from Docker Hub.
    
    (b)	Run the Docker Container in Prod/QA server attaching the created volume which contains the ML Model.
