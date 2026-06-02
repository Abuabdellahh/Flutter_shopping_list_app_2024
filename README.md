# 🛒 Flutter Shopping List

A Flutter grocery list app with real-time Firebase Realtime Database sync, clean architecture, and Docker support.

---

## Features

- Add & remove grocery items with category and quantity
- Real-time sync via Firebase Realtime Database
- Optimistic UI updates with auto-rollback on error
- Dark theme with Material 3
- Flutter Web support via Docker

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Provider |
| Backend | Firebase Realtime Database |
| HTTP Client | `http` package |
| Deployment | Docker + Nginx |

---

## Project Structure

```
lib/
├── data/        # Static seed data (categories)
├── models/      # Data classes (GroceryItem, Category)
├── screens/     # Full-page UI screens
├── widgets/     # Reusable UI components
├── providers/   # ChangeNotifier state management
├── services/    # Firebase REST API calls
├── theme/       # App theme & colors
├── utils/       # Constants & helpers
└── main.dart
```

---

## Getting Started

### Prerequisites

- Flutter SDK `>=2.19.2`
- Dart SDK
- A Firebase Realtime Database (REST enabled)

### Run locally

```bash
flutter pub get
flutter run
```

### Run with Docker

```bash
docker compose up --build
```

App will be available at `http://localhost:8080`

---

## Firebase Setup

The app uses Firebase Realtime Database via REST API.  
Update the base URL in `lib/utils/constants.dart`:

```dart
static const String firebaseBaseUrl = 'https://your-project-default-rtdb.firebaseio.com';
```

Data is stored under the `/shopping-list` node in this shape:

```json
{
  "shopping-list": {
    "<id>": {
      "name": "Apples",
      "quantity": 3,
      "category": "Fruit"
    }
  }
}
```

---

## License

MIT
