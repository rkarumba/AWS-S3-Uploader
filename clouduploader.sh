#!/bin/bash

# Script that uploads files to an S3 Bucket in AWS

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

# Calculate total size of all files in bytes
total_size=$(du -c "${file_paths[@]}" | tail -1 | awk '{print $1}')

# Upload using AWS CLI with progress bar (pv)
echo "Uploading files to s3://$bucket_name..."
tar -cf - "${file_paths[@]}" | pv -s "$total_size" | aws s3 cp - "s3://$bucket_name/archive_$(date +%Y%m%d%H%M%S).tar" 2>&1 | tee /tmp/aws_error.log


if [ $? -eq 0 ]; then
    echo "Upload complete!"
else
    echo "Upload failed. Please check the following error message from AWS CLI:"
    cat /tmp/aws_error.log
    exit 1
fi

# Clean up
rm /tmp/aws_error.log
