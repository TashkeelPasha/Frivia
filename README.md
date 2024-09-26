# Question-Answer App

This is a **Flutter-based mobile application** that fetches trivia questions from the **Trivia API** and displays them in a question-answer format. Users can test their knowledge across different categories and difficulty levels with a smooth and interactive interface.

## Table of Contents
- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [App Architecture](#app-architecture)
- [API Integration](#api-integration)
- [License](#license)

## Features
- Fetches random trivia questions from the [Trivia API](https://opentdb.com/api_config.php).
- Questions are categorized based on difficulty levels: **Easy**, **Medium**, and **Hard**.
- Supports **Light** and **Dark Mode**.
- Interactive UI with sliders and switches to adjust difficulty and theme preferences.
- Simple and intuitive navigation.



## Screenshots

| Light Mode | Dark Mode |
|------------|-----------|
| <img src="https://github.com/TashkeelPasha/Frivia/blob/main/Assets/lightmode.png" alt="Light Mode" width="300"/> | <img src="https://github.com/TashkeelPasha/Frivia/blob/main/Assets/darkmode.png" alt="Dark Mode" width="300"/> |


## Getting Started

### Prerequisites
To run this app, you'll need the following tools installed on your machine:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 2.0 or later)
- [Dart SDK](https://dart.dev/get-dart)
- A code editor like [VSCode](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/TashkeelPasha/Frivia.git
    cd Frivia
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    Use the following command to run the app on your emulator or connected device.

    ```bash
    flutter run
    ```

## App Architecture

The app is built using **Provider** for state management and follows a simple but scalable architecture:

- **UI Layer:** Contains all the screens and widgets.
- **Data Layer:** Manages API calls and responses from the Trivia API.
- **State Management:** Uses `Provider` for managing the theme and difficulty level of the questions.

### Files Structure:
```bash
lib/
│
├── providers/
│   └── theme_provider.dart  # Manages light/dark theme toggling
│    └──game_provider
│
├── screens/
│   ├── home.dart             # Main screen with theme and difficulty settings
│   └── home_page.dart        # Displays trivia questions
│
└── main.dart                 # App entry point
```

## API Integration
This app uses the Trivia API to fetch trivia questions. The API integration is handled with Dio for HTTP requests.

Sample API call:
```dart
_dio.options.baseUrl = 'https://opentdb.com/api.php';

var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': difficulty, // or you can manually assign a difficulty here like 'easy' , 'medium'
      },
    );

```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
