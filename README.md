# AWS S3 File Uploader

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple yet powerful Bash script for automating file uploads to Amazon S3 buckets. This script simplifies the process, handles credentials securely, and includes robust error handling.

## Features

*   **Seamless Uploads:** Effortlessly transfer files from your local system to your S3 buckets.
*   **Environment Variable Support:** Securely store your AWS credentials in environment variables.
*   **Error Handling:** Catches and logs errors, providing clear messages to help with troubleshooting.
*   **Region Flexibility:** Optionally specify your desired AWS region (defaults to us-west-1).
*   **Customization:** Easily modify the script to fit your specific needs.

## How to Use

1.  **Prerequisites:**
    *   Bash (installed on most Unix-like systems)
    *   AWS CLI (install instructions: [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
    *   Set your AWS credentials as environment variables:
        ```bash
        export AWS_ACCESS_KEY_ID=<your-access-key-id>
        export AWS_SECRET_ACCESS_KEY=<your-secret-access-key>
        export AWS_DEFAULT_REGION=<your-region>  # (Optional)
        ```

2.  **Usage:**
    ```bash
    ./s3_uploader.sh <file_path> <bucket_name>
    ```
    *   Replace `<file_path>` with the path to the file you want to upload.
    *   Replace `<bucket_name>` with the name of your S3 bucket.

## Example

```bash
./s3_uploader.sh my_document.txt my-important-files


![System-Diagram](clouduploader/Resources/DiagramS3Uploader)
