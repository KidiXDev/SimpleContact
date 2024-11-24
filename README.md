# SimpleContact - Flutter Contact Management App 📱

SimpleContact is a Flutter application that demonstrates local database management using `sqflite`, QR code generation, and contact management features. This project includes key functionalities like adding, updating, and deleting contacts, generating QR codes for contacts, and handling image selection and permissions.

## Features ✨

- **Contact Management**: Store and manage contacts locally using the `sqflite` package.
- **QR Code Generation**: Generate QR codes for each contact using the `qr_flutter` package.
- **Image Picker**: Choose profile images for contacts using the `image_picker` package.
- **Permission Handling**: Manage permissions for accessing storage, camera, etc., with the `permission_handler` package.

## Prerequisites 🔧

Before getting started, ensure you have the following installed:

- **Flutter SDK**: Version ^3.5.2
- **Dart SDK**: Version ^3.5.2

## Installation 🛠️

### 1. Clone the Repository

```bash
git clone https://github.com/KidiXDev/SimpleContact.git
```

### 2. Navigate to the Project Directory

```bash
cd SimpleContact
```

### 3. Install Dependencies

Run the following command to install all the dependencies:

```bash
flutter pub get
```

## Running the App 🚀

To run the app on an emulator or a physical device, use the following command:

```bash
flutter run
```

This will launch the app on the connected device or emulator.

## Project Structure 🗂️

- **`lib/`**: Contains the main Dart code for the application.
- **`android/`**: Android-specific configuration and code.
- **`ios/`**: iOS-specific configuration and code.
- **`macos/`**: macOS-specific configuration and code.
- **`windows/`**: Windows-specific configuration and code.
- **`linux/`**: Linux-specific configuration and code.
- **`assets/`**: Contains the assets used in the application (e.g., images, icons).

## Dependencies 📦

This project uses the following dependencies:

- `sqflite: ^2.3.0`: SQLite plugin for Flutter for local database management.
- `sqflite_common_ffi: ^2.3.0+4`: Provides FFI support for sqflite.
- `path: ^1.8.3`: Utility to handle file paths.
- `provider: ^6.1.2`: State management using the provider package.
- `camera: ^0.11.0+2`: Access the camera for QR code scanning (optional feature).
- `image_picker: ^1.1.2`: For picking images from gallery or camera.
- `permission_handler: ^11.3.1`: Manage permissions for camera, storage, etc.
- `path_provider: ^2.1.5`: Find commonly used directories on the device.
- `qr_flutter: ^4.1.0`: QR code generation package.
- `phone_numbers_parser: ^9.0.2`: Parse phone numbers for validation and formatting.

## License 📝

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements 🙏

- **Flutter**: The framework used to build this app.
- **Dart**: The programming language for Flutter development.
- **sqflite**: The package for local SQLite database management.
- **qr_flutter**: The package used for generating QR codes.
- **image_picker**: For selecting images from the gallery or camera.
- **permission_handler**: For managing permissions within the app.

## Note 📌

This project is still work in progress and will be updated with more features and improvements. Feel free to contribute and suggest new features to enhance the app further. 🚀
