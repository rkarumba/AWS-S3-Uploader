#!/bin/bash

# Script that uploads multiple files to an S3 Bucket in AWS

# Error Handling
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <file_path1> <file_path2> ... <bucket_name>"
    exit 1
fi

# Get Arguments
file_paths=("$@")                 # Store all arguments in the array
bucket_name="${file_paths[@]: -1}"  # Get the last argument as the bucket name
file_paths=("${file_paths[@]:0:$(($#-1))}") # Remove the last argument from the array


# AWS Credentials (Environment Variables)
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-us-west-1}" #Set Default to us-west-1 N.California 

# Validate the AWS Credentials 
if [[ -z "AWS_ACCESS_KEY_ID" || -z "AWS_SECRET_ACCESS_KEY" ]]; then
    echo "Error : AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY have not been set or found"
    echo "Please set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables"
    exit 1
fi

# Validating the File path
for file_path in "${file_paths[@]}"; do
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found at $file_path"
        exit 1
    fi
done

# Upload each file individually
echo "Uploading files to s3://$bucket_name..."
for file_path in "${file_paths[@]}"; do
    file_name=$(basename "$file_path")  # Extract file name
    aws s3 cp "$file_path" "s3://$bucket_name/$file_name" 2>&1 | tee /tmp/aws_error.log
    if [ $? -eq 0 ]; then
        echo "Uploaded $file_name successfully!"
    else
        echo "Failed to upload $file_name. Please check the following error message from AWS CLI:"
        cat /tmp/aws_error.log
        exit 1
    fi
done

# Clean up
rm /tmp/aws_error.log
