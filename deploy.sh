#!/bin/bash

# Variables
PROJECT_ID="projecttiktok"
IMAGE_NAME="tiktok-downloader"
REGION="us-central1"  # Change to your preferred region

# Authenticate (Optional if you're already authenticated)
# gcloud auth login

# Set the project ID
gcloud config set project $PROJECT_ID

# Build the Docker image
docker build -t $IMAGE_NAME .

# Tag the image for Google Container Registry
docker tag $IMAGE_NAME gcr.io/$PROJECT_ID/$IMAGE_NAME

# Push the image to Google Container Registry
docker push gcr.io/$PROJECT_ID/$IMAGE_NAME

# Deploy to Cloud Run
gcloud run deploy $IMAGE_NAME --image gcr.io/$PROJECT_ID/$IMAGE_NAME --platform managed --region $REGION --allow-unauthenticated

echo "Deployment complete."
