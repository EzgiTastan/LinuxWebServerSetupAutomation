# Project: Web Server Setup Script

## Overview
This project offers a shell script to facilitate setting up a web server on a Linux system. The script automates the process of installing dependencies, deploying a website (using a template from tooplate.com as an example), and configuring the Apache HTTP server.

## Features
- **Dependency Installation**: Automatically installs necessary packages using `yum`.
- **Service Management**: Starts and enables the Apache HTTPD service.
- **Artifact Deployment**: Downloads a website template from [Tooplate](https://www.tooplate.com) and deploys it to the server.
- **Service Restart**: Restarts the HTTPD service to apply changes.
- **Cleanup**: Removes temporary files after deployment.

## Script Explanation
The provided shell script (`websetup.sh`) performs the following steps:

1. **Installing Dependencies**: Installs required packages such as `wget`, `unzip`, and `httpd`.

    ```bash
    sudo yum install wget unzip httpd -y > /dev/null
    ```

2. **Starting and Enabling HTTPD Service**: Initiates the Apache HTTPD service and ensures it starts on system boot.

    ```bash
    sudo systemctl start httpd
    sudo systemctl enable httpd
    ```

3. **Creating a Temp Directory**: Sets up a temporary directory for artifact deployment.

    ```bash
    mkdir -p /tmp/webfiles
    cd /tmp/webfiles
    ```

4. **Downloading and Deploying Website Artifact**: Retrieves a website template from Tooplate, unzips it, and copies the contents to the Apache web root directory.

    ```bash
    wget https://www.tooplate.com/zip-templates/2110_character.zip > /dev/null
    unzip 2110_character.zip > /dev/null
    sudo cp -r 2110_character/* /var/www/html/
    ```

5. **Restarting HTTPD Service**: Restarts the Apache HTTPD service to apply changes.

    ```bash
    systemctl restart httpd
    ```

6. **Cleaning Up**: Removes temporary files created during deployment.

    ```bash
    rm -rf /tmp/webfiles
    ```

7. **Verification**: Displays the status of the HTTPD service and lists files in the web root directory.

    ```bash
    sudo systemctl status httpd
    ls /var/www/html/
    ```

## Usage
1. Clone the repository.
2. Execute the `dismantle.sh` script first with appropriate permissions.

    ```bash
    chmod +x dismantle.sh
    ./dismantle.sh
    ```
3. Execute the `websetup.sh` script first with appropriate permissions.

    ```bash
    chmod +x websetup.sh
    ./websetup.sh
    ```

## Contributing
Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.
