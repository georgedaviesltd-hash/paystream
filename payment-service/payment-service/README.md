# ⚙️ PayStream — Transaction Processing Backend Service

This directory serves as the core transaction router for the PayStream system, managing payment records, telemetry triggers, and messaging webhooks.

## 🚀 Technical Framework Stack
*   **Web Framework Architecture**: Python 3.12 (FastAPI Async Engine)
*   **Telemetry Stream Metrics**: Prometheus Client Instrumentation Hook Blocks
*   **Data Models Validation**: Pydantic v2 Serialization Engine

## ⚙️ Local Sandbox Engineering Tasks
To run validation tasks or patch API logic loops on your local workstation machine:

```bash
# 1. Access the working service directory
cd payment-service/payment-service

# 2. Spin up an isolated python execution pool environment
python3 -m venv .venv
source .venv/bin/activate

# 3. Inject dependency components into the sandbox profile
pip install -r requirements.txt

# 4. Initialize the asynchronous API engine locally
uvicorn main:app --reload --port 8000
```

## 📊 Observability Metrics Tracking Endpoints
*   **Liveness & Health Checks**: `GET http://localhost:8000/health`
*   **Core Systems Ledger Data**: `GET http://localhost:8000/api/v1/payments`
*   **Prometheus Target Diagnostics**: `GET http://localhost:8000/metrics`
