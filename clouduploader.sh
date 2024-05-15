#!/bin/bash

# Script that uploads files based on files to an S3 Bucket in AWS 

# Error Handling 
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <file_path> <bucket_name>"
    exit 1 
fi 

# Get Arguments file 
file_path="$1"
bucket_name="$2"

# AWS Credentials (Environment Variables)
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-us-west-1}" #Set Default to us-west-1 N.California 

# Validate the AWS Credentials 
if [[ -z "AWS_ACCESS_KEY_ID" || -z "AWS_SECRET_ACCESS_KEY" ]]; then
    echo "Error : No Valid AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY have not been set or found"
    echo "Please set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables"
    exit 1
fi

# Vaildating the File path 
if [[ ! -f "$file_path" ]]; then
    echo "Error: File not found at $file_path"
    exit 1
fi


# Upload using AWS CLI
echo "Uploading $file_path to s3://$bucket_name..."
if ! aws s3 cp "$file_path" "s3://$bucket_name" 2>&1; then #Capture error output
    echo "Upload failed. Please check the following error message from AWS CLI:"
    # Print the error message directly without filtering 
    cat /tmp/aws_error.log # or any other suitable log file 
    exit 1
else
    echo "Upload complete!"
fi
