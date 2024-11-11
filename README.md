# BoltBay

## Getting started

first install the npm dependencies:

```bash
npm install
```

run the development server:

```bash
npm run dev
```

Finally, open [http://localhost:3000](http://localhost:3000) in your browser to view the website.

## Development Guide

## Quick Start

1. Clone the repository

```bash
git clone <repository-url>
cd <project-directory>
```

2. Start development environment

```bash
make dev
```

## Available Commands

- `make dev` - Start development environment
- `make stop` - Stop development environment
- `make logs` - View logs
- `make clean` - Clean up Docker resources
- `make test` - Run tests

## Deployment

- Staging and production deployments are automated
- Just push to the respective branch:
  - `staging` branch -> Staging environment
  - `main` branch -> Production environment

## Important Notes

- Local development uses `docker-compose`
- Never manually deploy to staging/production
- All deployments are handled by CI/CD
