# Flutter Induction Project "Sales App"

![logo](https://github.com/sheyls/Sales-App-flutter/assets/70074598/ad89d052-fadc-4310-8ed6-95717229b39b)

This project is a Flutter application that connects to a PHP API using Ngrok to handle user login. The application includes authentication, sales notes management, and sales reports functionalities.

## Features

### Login
- User authentication via email and password.
- Secure connection to the PHP API using Ngrok.
- Local storage of user information after a successful login.

### Sales Notes Management
- Add new sales notes (with as many details as desired).
- Store sales notes locally.

### Sales Reports
- View a consolidated report of all sales made.

## Project Structure

The project is organized into several layers to maintain separation of concerns and modularity:

#### `lib/core/helpers`
- **constants.dart**: Defines constants used in the application.

#### `lib/localization`
- **app_localization.dart**: Manages the localization of the application.
- **es_cl/**: Contains the translation files in Spanish (Chile).

#### `lib/presentation`
- **home_screen**
  - `home_screen.dart`: Main screen of the application.
- **login_screen**
  - **binding**: Manages dependency injection for the login screen.
  - **controller**: Controller to handle the login logic.
  - **models**: Data models used in the login screen.
  - `login_screen.dart`: Login screen.
- **sale_note_report_screen**
  - **controller**: Controller to handle the sales notes report logic.
  - `sale_note_report_screen.dart`: Screen to view the sales notes report.
- **sale_note_screen**
  - **binding**: Manages dependency injection for the sales notes screen.
  - **controller**: Controller to handle the sales notes logic.
  - **models**: Data models used in the sales notes screen.
  - `sale_note_screen.dart`: Screen to add and view sales notes.

#### `lib/repositories`
- **auth_repository.dart**: Definition of the authentication repository.
- **auth_repository_imp.dart**: Implementation of the authentication repository.

#### `lib/routes`
- Manages the navigation routes of the application.

#### `lib/services`
- **api_service.dart**: Service to handle API requests.
- **local_storage_service.dart**: Service to handle local storage of user data and sales notes using SharedPreferences.

#### `lib/theme`
- **theme_helper.dart**: Manages the themes of the application.

#### `lib/widgets`
- Contains reusable widgets in the application.

#### `main.dart`
- Entry point of the application.

## Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- [Ngrok](https://ngrok.com/) installed to expose your local API.
- A PHP server running locally.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

