# Pak SIM App 🇵🇰

A sleek and efficient Flutter application designed to fetch and display Pakistani SIM card ownership details based on a mobile number or CNIC. Built with a clean architecture and a focus on a smooth user experience.

![GitHub last commit](https://img.shields.io/github/last-commit/shoaibhassan2/paksimapp?style=for-the-badge)
![GitHub repo size](https://img.shields.io/github/repo-size/shoaibhassan2/paksimapp?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/shoaibhassan2/paksimapp?style=for-the-badge)

---

## 📸 Screenshots

*(**Developer Note:** Replace these placeholder links with actual screenshots of your app. You can upload screenshots directly to your repository and link them here.)*

| Light Mode                                     | Dark Mode                                    |
| ---------------------------------------------- | -------------------------------------------- |
| <img src="" width="250"> | <img src="" width="250"> |
| *Search Screen*                                | *Search Screen (Dark)*                       |
| <img src="" width="250"> | <img src="" width="250"> |
| *Results Dialog*                               | *Results Dialog (Dark)*                      |

---

## ✨ Key Features

-   **SIM Data Search**: Quickly find SIM card details by providing a phone number or CNIC.
-   **Detailed Information**: Retrieves Name, CNIC, Address, and Mobile Number.
-   **Dual Theme Support**: Seamlessly switch between a beautiful light and an elegant dark theme. Your preference is saved for the next launch.
-   **Copy to Clipboard**: Easily copy any piece of information (Name, CNIC, etc.) with a single tap.
-   **User-Friendly Interface**: Clean, modern, and intuitive UI designed for ease of use.
-   **Error Handling**: Provides clear, user-friendly feedback for invalid searches or network issues.
-   **Loading States**: Smooth loading indicators provide feedback during network requests.

---

## 🛠️ Tech Stack & Architecture

This project is built with a focus on maintainability and scalability, utilizing a feature-first architecture that separates concerns neatly.

-   **Framework**: [Flutter](https://flutter.dev/)
-   **Language**: [Dart](https://dart.dev/)
-   **Architecture**:
    -   **Feature-First Structure**: Code is organized by features (`paksim`) rather than by type (`widgets`, `screens`).
    -   **Separation of Concerns**:
        -   `data/`: Handles the logic for fetching data (Models, Services).
        -   `presentation/`: Manages the UI (Screens, Widgets) and its state (Controller).
    -   **Simple State Management**: Uses Flutter's built-in `ValueNotifier` and a custom `PakSimController` to manage UI state without external packages, perfect for single-screen complexity.
-   **Core Packages**:
    -   `http`: For making network requests to the SIM data service.
    -   `html`: For parsing the HTML response from the server.
    -   `shared_preferences`: To persist the selected theme (light/dark) across app launches.

---

## 📁 Project Structure

The codebase is organized into a clean, feature-driven structure:

```
lib
├── core/
│   └── theme/            # App-wide theming (light/dark, constants, controller)
│
├── features/
│   ├── data/
│   │   ├── models/       # Data models (SimDataModel)
│   │   └── services/     # API service to fetch data (PakSimService)
│   │
│   └── presentation/
│       ├── controllers/  # UI logic and state management (PakSimController)
│       ├── screens/      # The main screen of the feature
│       └── widgets/      # Reusable widgets for the feature (dialogs, forms, etc.)
│
└── main.dart             # App entry point
```

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK (v3.0.0 or higher)
-   An IDE like Android Studio or VS Code

### Installation

1.  **Fork** the repository.
2.  **Clone** your forked repository:
    ```sh
    git clone https://github.com/YOUR-USERNAME/paksimapp.git
    ```
3.  Navigate to the project directory:
    ```sh
    cd paksimapp
    ```
4.  Install the dependencies:
    ```sh
    flutter pub get
    ```
5.  Run the app:
    ```sh
    flutter run
    ```

---

## 📝 To-Do / Future Improvements

While the app is fully functional, the following enhancements could be made:

-   [ ] **Unit & Widget Testing**: Implement tests for services and widgets to ensure reliability.
-   [ ] **Input Formatting**: Add a `TextInputFormatter` to format the phone number/CNIC input in real-time.
-   [ ] **Search History**: Implement a local database (like Hive or Isar) to save recent searches.
-   [ ] **Caching**: Implement a simple caching mechanism to avoid re-fetching data for the same number in a short period.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/shoaibhassan2/paksimapp/issues).

1.  **Fork** the project.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a **Pull Request**.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---