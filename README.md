# Only Contacts

## Overview
**Only Contacts** is a simple yet efficient Flutter application designed for managing contacts. It allows users to store and retrieve contact information locally with ease. The app is built using modern Flutter practices, ensuring smooth performance and a great user experience.

## Features
- **Contact Management:** Add, update, and delete contacts easily.
- **Local Data Storage:** Contacts are stored locally on the device for quick access.
- **Responsive UI:** Adaptable design that works across devices with different screen sizes.

## Technology Stack
- **Flutter**: The app is built using Flutter, a powerful cross-platform framework.
- **SQLite (via sqflite package)**: Contact information is stored using the `sqflite` package, providing efficient local storage.
- **State Management**: The app uses `ValueNotifier` to efficiently manage state and trigger UI updates based on changes.

## How It Works
- The **sqflite** package is used to store contact information in a local SQLite database, ensuring data persistence between app sessions.
- **ValueNotifier** is implemented for managing state, ensuring the app reacts to changes in data and updates the UI accordingly.

## Screenshots
<p align="center">
  <img src="/images/image1.jpeg" alt="Screenshot 1" width="200"/>
  <img src="/images/image2.jpeg" alt="Screenshot 2" width="200"/>
</p>

## Contributing

WELCOME! We welcome all contributions to **Only Contacts**! Whether you're fixing bugs, adding new features, or improving documentation, your help is appreciated.

Feel free to submit a pull request or open an issue to get started.
