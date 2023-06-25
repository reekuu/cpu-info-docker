# Docker CPU Information Container
This repository contains a Docker container that retrieves and saves host machine's CPU information. The container was created as part of a test task, and it serves as a reminder of my ability to write such scripts.

### Prerequisites
- Docker installed on your system

### Building the Docker Image
To build the Docker image, follow the steps below:
1. Clone or download this repository to your local machine.
2. Open a terminal and navigate to the directory where the Dockerfile is located.
3. Run the following command to build the Docker image:
```bash
docker build --build-arg USERNAME=username -t myimage .
```

### Running the Docker Container
Once the Docker image is built, you can run a container based on it.  
Use the following steps:
1. Open a terminal.
2. Execute the command below to start the container, replacing name with your desired name and $(pwd)/:/output with the desired output directory path:
```bash
docker run --rm --env MYNAME=name --volume $(pwd)/:/output myimage
```

### Output
The container executes a script that retrieves the CPU information of the host machine and saves it to a file named `cpu.txt` inside the output directory specified during container execution.

### Cleaning Up
When you have finished using the container, you can remove the Docker image by running the following command in a terminal:
```bash
docker rmi myimage
```
> Note: The above command removes the Docker image named myimage. If you have multiple images with the same name, make sure to specify the appropriate image ID or tag.

Additional Information

- The `USERNAME` build argument is used to create a non-root user with the specified username inside the Docker container.
- By default, the `MYNAME` environment variable is set to 'unknown'. You can override it during container execution by providing the `--env` option followed by `MYNAME=name`.
- The script `script.sh` is created inside the container, which retrieves the host machine's CPU information and writes it to the `cpu.txt` file located in the specified output directory.

Feel free to modify the Dockerfile or adjust the commands according to your requirements.

This project is a testament to my ability to write useful scripts and work with Docker containers.