# AWS S3 File Uploader 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Elevate your file management with this simple yet powerful Bash script! Effortlessly automate uploads to Amazon S3 buckets, ensuring security and reliability. 💪

## Features ✨

*   **Seamless Uploads:** Transfer files to your S3 buckets like a breeze. 💨
*   **Secure Credentials:** Safeguard your AWS credentials using environment variables. 🔒
*   **Error Handling:** Swiftly resolves errors and guides you through the process. 🛠️
*   **Region Flexibility:** Choose your preferred AWS region or stick with the default us-west-1. 🌎
*   **Customization:** Tailor the script to fit your unique workflow. 🎨

## Getting Started 🏁

1.  **Prerequisites:**
    *   Bash (pre-installed on most systems)
    *   AWS CLI (install guide: [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
    *   Have your AWS credentials ready (environment variables):
        ```bash
        export AWS_ACCESS_KEY_ID=<your-access-key-id>
        export AWS_SECRET_ACCESS_KEY=<your-secret-access-key>
        export AWS_DEFAULT_REGION=<your-region>  # Optional, defaults to us-west-1
        ```

2.  **Let's Upload!** 📤
    ```bash
    ./s3_uploader.sh <file_path> <bucket_name>
    ```
    *   Replace `<file_path>` with the path to your file.
    *   Replace `<bucket_name>` with your S3 bucket's name.

## Showcase 📸

```bash
./s3_uploader.sh car_show_footage.zip sweet-car-flicks
```

Zip your awesome car show footage and send it to the "sweet-car-flicks" bucket! 🚗💨

## Under the Hood ⚙️

![System Diagram](/Resources/DiagramS3Uploader.png)

See how it all connects? The script, your files, AWS CLI, and your S3 bucket – working together in perfect harmony. 🎶

## Contribute & Share the Love ❤️

Your feedback and contributions are gold! Found a bug? 🐛 Have an idea? 💡 Let's make this script even better together! Open an issue or submit a pull request.

## License 📄

This project is licensed under the MIT License – see the [LICENSE.md](LICENSE.md) file for details.