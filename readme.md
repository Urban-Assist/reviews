<div align="center">
  
# 📝 Reviews Microservice

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/username/urban-assist)
[![Node](https://img.shields.io/badge/node-%3E%3D%2018.0.0-green.svg)](https://nodejs.org)
[![License](https://img.shields.io/badge/license-ISC-red.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

<img src="https://via.placeholder.com/200?text=Reviews+Service+Logo" alt="Reviews Service Logo" width="200"/>

*Efficient and scalable review management for Urban Assist platform*

[Getting Started](#-getting-started) •
[Installation](#-installation) •
[Configuration](#-configuration) •
[API](#-api-endpoints) •
[Docker](#-docker) •
[Kubernetes](#-kubernetes) •
[Contributing](#-contributing)

</div>

---

## 📚 Overview

This microservice handles all review-related operations within the Urban Assist application. Built with Node.js and Express, it integrates with MySQL for data storage and RabbitMQ for asynchronous operations.

<details>
<summary>✨ Key Features</summary>

- **CRUD Operations** - Add, fetch, and delete reviews
- **User Authentication** - Secure endpoints with JWT-based authentication
- **Role-Based Authorization** - Fine-grained access control for users and admins
- **Database Integration** - Seamless MySQL support via Sequelize ORM
- **Asynchronous Processing** - RabbitMQ for handling provider deletion events
- **Scalability** - Auto-scaling in Kubernetes environments
- **High Availability** - Multi-node deployment for failover protection
- **Rolling Updates** - Zero-downtime deployments with Kubernetes
- **Resource Efficiency** - Optimized container footprint for better resource utilization

</details>

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- **Node.js** (v18 or higher): [Download Node.js](https://nodejs.org/)
- **npm** (comes with Node.js): Package manager for dependencies
- **Git**: [Download Git](https://git-scm.com/downloads) for version control
- **Docker**: [Install Docker](https://www.docker.com/)
- **Kubernetes**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/)

### 📦 Installation

1. **Clone the repository**:

   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the reviews directory**:

   ```bash
   cd urban-assist/reviews
   ```

3. **Install dependencies**:

   ```bash
   npm install
   ```

---

## ⚙️ Configuration

### Environment Variables

The service uses a Kubernetes secret for environment variables. Refer to `k8s/secret.yaml` for the configuration. Below are the key variables:

```plaintext
PORT=8089
DATABASE_HOST=mysql-service
DATABASE_PORT=5151
DATABASE_USER=root
DATABASE_PASSWORD=admindevelopers
DATABASE_NAME=reviews
JWT_SECRET=<your-jwt-secret>
USER_MANAGEMENT_SERVICE=http://user-management:8083
RABIT_MQ_NAME=deleteUser
RABIT_MQ_URL=<your-rabbitmq-url>
CORS_ORIGIN=*
```

---

## 🏃‍♂️ Running the Service

Choose the mode that best fits your needs:

| Command | Description |
|---------|-------------|
| `npm start` | Start the service in production mode |
| `npm run dev` | Development mode with auto-restart |

---

## 🐳 Docker

Run the service using Docker:

```bash
# Build the image
docker build -t reviews-service .

# Run the container
docker run -p 8089:8089 --env-file .env reviews-service
```

---

## ☸️ Kubernetes

Deploy the service to Kubernetes for advanced orchestration capabilities:

```bash
# Apply secret config
kubectl apply -f k8s/secret.yaml

# Apply deployment config
kubectl apply -f k8s/deployment.yaml

# Apply service config
kubectl apply -f k8s/service.yaml

# Check deployment status
kubectl get deployments
```

### Kubernetes Features

| Feature | Description | Impact |
|---------|-------------|--------|
| **Auto-scaling** | Dynamically scales pods based on CPU/memory usage | Handles traffic spikes efficiently |
| **Self-healing** | Automatically restarts failed containers | Improves uptime and reliability |
| **Rolling updates** | Updates containers without downtime | Ensures continuous service availability |
| **Load balancing** | Distributes traffic across pods | Optimizes resource usage |
| **Resource limits** | Controls CPU and memory allocation | Prevents resource starvation |

---

## 📡 API Endpoints

| Endpoint | Method | Description | Request Body | Response |
|----------|--------|-------------|-------------|----------|
| `/reviews/addReview` | POST | Add a new review | `{ "providerID": 1, "review": "Great service!", "rating": 5 }` | `{ "message": "Review created successfully", "status": 201 }` |
| `/reviews/getReviews/:providerID` | GET | Fetch reviews for a provider | - | `{ "data": [ ...reviews ], "status": 200 }` |
| `/reviews/randomReviews` | GET | Fetch random reviews | - | `{ "data": [ ...reviews ], "status": 200 }` |
| `/reviews/providerDeleted` | DELETE | Delete reviews for a provider | `{ "userId": 1 }` | `{ "message": "Reviews deleted successfully", "status": 200 }` |

### Example Request

```bash
curl -X POST http://localhost:8089/reviews/addReview \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-token>" \
  -d '{
    "providerID": 1,
    "review": "Excellent service!",
    "rating": 5
  }'
```

---

## 📊 Monitoring & Logs

The service includes comprehensive logging and monitoring capabilities:

- **Console Logs**: For debugging and operational insights
- **Health Checks**: Regular service status reports
- **Kubernetes Dashboard**: Visual interface for cluster monitoring
- **Pod Metrics**: Real-time resource usage statistics

---

## 🛠 Technologies

<div align="center">

[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![RabbitMQ](https://img.shields.io/badge/RabbitMQ-FF6600?style=for-the-badge&logo=rabbitmq&logoColor=white)](https://www.rabbitmq.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)

</div>

---

## 🚢 Deployment Impact Features

| Feature | Description | Business Impact |
|---------|-------------|----------------|
| **Circuit Breaking** | Prevents cascading failures across services | Improves system resilience during partial outages |
| **Blue/Green Deployment** | Zero-downtime deployments with instant rollback | Reduces deployment risk and customer impact |
| **Infrastructure as Code** | Kubernetes manifests for consistent deployments | Eliminates environment inconsistencies |
| **Horizontal Pod Autoscaler** | Automatically scales based on CPU/memory metrics | Optimizes cost while maintaining performance |
| **Graceful Shutdown** | Properly closes connections on termination | Prevents data loss during deployments |
| **Pod Disruption Budget** | Ensures minimum availability during updates | Maintains SLAs during cluster maintenance |
| **ConfigMaps & Secrets** | Externalized configuration management | Simplifies environment-specific settings |

---

## 👥 Contributing

Contributions are always welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the ISC License. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Urban Assist Platform** • Created with ❤️ by the Urban Assist Team

</div>
