# Automated CI/CD Pipeline for a Dockerized Flask Application

A hands-on DevOps project focused on building, testing, containerizing, and eventually automating the deployment of a Python Flask application using Docker, GitHub Actions, and Linux.

## Project Overview

This project demonstrates the development of a simple Flask web application and the implementation of DevOps practices to streamline application testing, containerization, and deployment.

The application serves as the foundation for an automated CI/CD pipeline. Development currently includes Flask application development, automated testing with pytest, Git version control, and Docker containerization.

## Project Objective

The ultimate goal is to develop a practical DevOps workflow that demonstrates source control, automated testing, Docker containerization, continuous integration, and automated deployment to a Linux environment.

## Technologies Used

- **Programming Languages:** Python
- **Web Framework:** Flask
- **Testing:** pytest
- **Containerization:** Docker, Dockerfile
- **Version Control:** Git, GitHub
- **Operating Systems:** macOS (development), Ubuntu Linux (planned deployment)
- **Automation:** GitHub Actions (planned)
- **Configuration:** YAML (planned)

## Application Features

The Flask application currently provides three HTTP endpoints:

| Endpoint | Description |
|---|---|
| `/` | Displays the application homepage |
| `/health` | Returns the application's health status |
| `/info` | Returns application version and environment information |

### Automated Testing

Implemented automated application tests using pytest to verify endpoint functionality and HTTP responses.

Current test coverage includes:

- Homepage response validation.
- Health endpoint status and response validation.

Tests are executed using:

```bash
python -m pytest -v
```

**Current results:** Both implemented tests pass successfully.

## Docker Containerization

The Flask application has been containerized using Docker to provide an isolated and consistent runtime environment.

### Docker Configuration

A custom `Dockerfile` defines the application's container environment:

- Uses the official `python:3.13-slim` base image.
- Establishes `/app` as the container working directory.
- Installs Python dependencies from `requirements.txt`.
- Copies application source files into the container.
- Exposes port `5001`.
- Starts the Flask application when the container launches.

A `.dockerignore` file excludes unnecessary files and directories from the Docker build context, including local virtual environments, Git metadata, and generated cache files.

### Building the Docker Image

Build the application image from the project directory:

```bash
docker build -t automated-devops-project .
```

### Running the Container

Create and launch a container from the built image:

```bash
docker run -d --name flask-devops-app -p 5001:5001 automated-devops-project
```

The application can then be accessed locally:

- Homepage: http://localhost:5001
- Health Check: http://localhost:5001/health
- Application Information: http://localhost:5001/info

### Container Management

The following Docker commands are used to manage and monitor the application container:

```bash
# Display running containers
docker ps

# Display all containers, including stopped containers
docker ps -a

# View application logs
docker logs flask-devops-app

# Stop the container
docker stop flask-devops-app

# Start an existing stopped container
docker start flask-devops-app

# Restart the container
docker restart flask-devops-app
```

### Application Verification

Verified successful container execution through browser testing and Docker logs.

Confirmed that:
- The Flask application starts successfully inside the container.
- All three application endpoints return successful HTTP responses.
- Docker captures application startup output and incoming HTTP requests.
- The container can be stopped and restarted without rebuilding the image.

## Repository Structure

```text
automated-devops-project/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
├── .gitignore
│
├── tests/
│   └── test_app.py
│
└── README.md
```

## Current Development Status

| Component | Status |
|---|---|
| Flask application | Completed |
| Automated pytest tests | Completed |
| Git and GitHub integration | Completed |
| Dockerfile configuration | Completed |
| Docker image creation | Completed |
| Container execution and management | Completed |
| Production WSGI server | Planned |
| GitHub Actions CI/CD pipeline | Planned |
| Automated Linux deployment | Planned |
| Application logging and monitoring enhancements | Planned |

## Future Development

The next stages of development will focus on expanding the project into a fully automated CI/CD workflow:

1. **Production Configuration:** Replace Flask's built-in development server with a production WSGI server such as Gunicorn.
2. **CI/CD Automation:** Implement GitHub Actions workflows to automatically execute tests and build Docker images when changes are pushed to the repository.
3. **Linux Deployment:** Configure an Ubuntu Linux server to host the containerized application.
4. **Automated Deployment:** Extend the CI/CD pipeline to deploy application updates to the remote Linux server.
5. **Monitoring and Health Checks:** Expand application health verification and introduce additional logging and monitoring capabilities.