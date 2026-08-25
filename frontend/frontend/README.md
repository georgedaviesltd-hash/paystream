# 💳 PayStream — Modern Frontend Dashboard

This directory houses the interactive real-time banking and clearing-house monitoring dashboard engine for the PayStream microservice platform.

## 🚀 Technical Framework Stack
*   **Base Compiler Engine**: React 18 (Structured via Vite 5)
*   **Style Pipeline Layout**: Tailwind CSS v3
*   **Vector Icon Assets**: Lucide React Framework

## ⚙️ Local Sandbox Engineering Tasks
To launch and test changes across the client components on your local station:

```bash
# 1. Access the working directory
cd frontend/frontend

# 2. Extract application asset dependencies
npm install

# 3. Fire up the local Vite hot-reloading development pipeline
npm run dev
```

The web panel interface will automatically mount on your system loop at: `http://localhost:5173`.

## 🐳 Production Containerization Engine
The application compiles into an isolated, hardened image leveraging a two-tiered multi-stage deployment model to drastically shrink artifact size and block security vulnerabilities:
1.  **Stage 1 (Node Build)**: Transpiles and packages raw source files into static HTML/JS bundles.
2.  **Stage 2 (Nginx Server Core)**: Injects the distribution static files into a production-grade Nginx server configuration, handling internal proxy forwarding blocks on port `80`.
