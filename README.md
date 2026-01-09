# Cosmos Notes

A full-stack sample application demonstrating a modern **SwiftUI iOS app** backed by an **Azure Functions (Node.js v4) API** with **Azure Cosmos DB** for persistence.

This project was built to showcase clean architecture, modern async patterns, and real cloud integration rather than mock data or local storage.

---

## Architecture Overview

### Frontend
- SwiftUI (iOS 17 compatible)
- MVVM architecture
- Async/await networking
- NavigationStack with modern toolbar placement
- State management using `ObservableObject` and `@Published`

### Backend
- Azure Functions (Node.js v4 programming model)
- HTTP-triggered API
- Azure Cosmos DB (NoSQL API)
- Simple REST design with GET and POST endpoints

### Data Flow

SwiftUI App
-> Azure Functions API
-> Cosmos DB
-> JSON response
-> SwiftUI UI update


---

## Features

- SwiftUI app with modern navigation
- MVVM architecture
- Async/await networking
- Azure Functions (Node.js v4) API
- Azure Cosmos DB persistence
- Create and read notes in real time
- Clean monorepo structure
- iOS 17 toolbar behavior handled correctly


---

## Running the Backend Locally

### Prerequisites
- Node.js 18 or newer
- Azure Functions Core Tools v4
- An Azure Cosmos DB account (connection string stored locally)

### Steps

```bash
git clone https://github.com/dpayne5532/cosmosdb-practice.git
cd cosmosdb-practice/backend/cosmos-notes-api
npm install
func start
```
The API will be available at:

http://localhost:7071/api/notes


---

## Running the iOS App

1. Open the Xcode project:

2. Select an iOS simulator or a connected physical device.

3. Build and run the application.

When the backend is running locally, the app will automatically load and create notes using the local Azure Functions API.

---

## Notes on Configuration

- `local.settings.json` is intentionally excluded from source control, as it contains environment-specific configuration and secrets.
- `node_modules` is excluded and regenerated via `npm install`.
- The SwiftUI app is configured to target `localhost` in Debug builds for local development.

---

## Purpose

This project serves as a practical demonstration of:

- End-to-end cloud integration
- Real backend services (no mock data)
- Clean SwiftUI architecture using MVVM
- Modern async/await programming patterns
- A production-shaped repository structure suitable for real-world projects
