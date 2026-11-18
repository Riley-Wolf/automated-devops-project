# Automated CI/CD Pipeline for a Dockerized Flask Application

A containerized Python Flask application with automated testing, a production-oriented WSGI server, and Docker health monitoring. This project is designed to demonstrate practical DevOps concepts, including application deployment, containerization, and infrastructure automation.

## Project Overview

This project implements a Flask web application packaged into a Docker container. Gunicorn serves the application using multiple worker processes, while Docker HEALTHCHECK monitors application availability through a dedicated health endpoint.

The long-term objective is to develop a complete CI/CD pipeline that automatically tests, builds, and deploys application updates using GitHub Actions and an Ubuntu Linux server.

## Project Objective

The objective of this project is to develop practical experience with DevOps workflows by progressively implementing application testing, containerization, deployment automation, and infrastructure management.

The completed implementation and future enhancements will demonstrate how application development and operational processes can be integrated into a repeatable and automated deployment workflow.

## Technologies

| Technology | Purpose |
|---|---|
| Python | Application development |
| Flask | Web application framework |
| Pytest | Automated application testing |
| Docker | Application containerization |
| Gunicorn | Production WSGI application server |
| Linux | Container runtime environment |
| Git & GitHub | Version control and source code management |
| YAML | Docker and future CI/CD configuration |

## Application Features

The Flask application provides four HTTP endpoints:

| Endpoint | Description |
|---|---|
| `/` | Returns the application homepage |
| `/health` | Returns application health status |
| `/info` | Returns application version and environment information |
| `/version` | Returns application version and name |

### Automated Testing

Pytest is used to validate application functionality and endpoint responses.

Current test coverage includes:
- Homepage response validation.
- Health endpoint status validation.
- Application version and name validation.

Run the test suite locally:

```bash
python -m pytest -v
```

**Current result:** 3 tests passing.

## Docker Implementation

The application is containerized using a custom Dockerfile based on the official `python:3.13-slim` image.

The Docker configuration:
- Establishes an isolated application working directory.
- Installs Python dependencies from `requirements.txt`.
- Copies application source files into the container.
- Exposes port `5001`.
- Starts the application using Gunicorn with two worker processes.
- Implements a Docker health check against the `/health` endpoint.

### Build the Docker Image

```bash
docker build -t automated-devops-project .
```

### Run the Container

```bash
docker run -d --name flask-devops-app -p 5001:5001 automated-devops-project
```

The application is accessible at:

```text
http://localhost:5001
```

### Monitor Container Status

```bash
docker ps
```

### View Application Logs

```bash
docker logs flask-devops-app
```

### Check Container Health

```bash
docker inspect --format='{{json .State.Health}}' flask-devops-app
```

The Docker health check periodically sends an HTTP request to the application's `/health` endpoint and reports the container's health status.

## Project Structure

```text
automated_devops_project/
│
├── .github/
│   └── workflows/       # Planned GitHub Actions workflows
│
├── tests/
│   └── test_app.py      # Automated application tests
│
├── .dockerignore        # Excludes unnecessary Docker build files
├── .gitignore           # Excludes unnecessary Git files
├── app.py               # Flask application
├── Dockerfile           # Docker image configuration
├── requirements.txt     # Python dependencies
└── README.md            # Project documentation
```

## Development Roadmap

| Feature | Status |
|---|---|
| Flask application and REST endpoints | Complete |
| Automated testing with Pytest | Complete |
| Docker containerization | Complete |
| Gunicorn production WSGI server | Complete |
| Multi-worker application configuration | Complete |
| Docker health monitoring | Complete |
| GitHub Actions CI pipeline | In Progress |
| Automated Docker image builds | Planned |
| Ubuntu Linux deployment | Planned |
| Continuous Deployment (CD) | Planned |