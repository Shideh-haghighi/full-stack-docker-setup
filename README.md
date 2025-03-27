Full-Stack Docker Setup

This repository contains the Docker Swarm setup for deploying a full-stack application locally across multiple nodes.

Features

Frontend & Backend Services

MongoDB Database

Redis Caching

Secrets Management using Docker Secrets

Overlay Networks for Service Communication


Prerequisites

Docker & Docker Swarm initialized on all nodes


Setup Instructions

1. Create Secrets on Each Node

Run the following commands on every node in your Swarm cluster:

echo "http://localhost:3001" | docker secret create REACT_APP_BASE_URL -
echo "secret-key-dev" | docker secret create SECRET_KEY_FILE -
echo "mongodb://db:27017/app?readPreference=primary&directConnection=true&ssl=false" | docker secret create mongodb_url -

2. Deploy the Stack

docker stack deploy -c docker-compose.yml fullstack_app

Services

Networks

frontend_net: Connects frontend & backend

backend_net: Connects backend, database & Redis


Volumes

db_data: Stores MongoDB data persistently


Notes

The frontend and backend images are used locally and not pushed to a public registry.

The MongoDB connection URL was modified to suit this deployment.


Repository

The original source code for this application can be found here: https://github.com/DataDeveloper7865/full-stack-app-template
