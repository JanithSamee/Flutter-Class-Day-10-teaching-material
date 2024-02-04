# WebSocket Stream App

This is a simple Flutter application that demonstrates how to integrate WebSocket communication and stream handling in a Flutter app.

## Getting Started

1. **Clone the repository:**

    ```bash
    git clone https://github.com/JanithSamee/Flutter-Class-Day-10--teaching-material.git
    ```

2. **Navigate into the project directory:**

    ```bash
    cd your_repo
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## Overview

This app establishes a WebSocket connection with a server and sends and receives messages using streams. Here's a brief overview of the files in this project:

-   **main.dart:** Entry point of the application. It contains the `main` function and the `MyApp` widget.
-   **create_stream.dart:** Defines the `CreateStream` class responsible for managing the WebSocket connection and streams.

## Usage

-   When you run the app, you'll see a screen with a "send" button and a placeholder for displaying received data.
-   Press the "send" button to send a message to the WebSocket server.
-   The received data will be displayed on the screen.

## Creating WebSocket Stream Using Any Services

To create a WebSocket stream using any services:

1. **Choose a WebSocket service provider:** There are various WebSocket service providers available. Some popular ones include AWS IoT, Google Cloud IoT, and WebSocket.org.

2. **Set up a WebSocket server:** Follow the documentation provided by your chosen WebSocket service provider to set up a WebSocket server. This typically involves creating a WebSocket endpoint and obtaining credentials.

3. **Update the WebSocket URL in `main.dart`:** Once you have the WebSocket server set up, update the WebSocket URL in the `wsUrl` string in `main.dart` with the URL provided by your WebSocket service provider.

4. **Run the app:** After updating the WebSocket URL, run the Flutter app. It should now establish a WebSocket connection with the server specified in the URL.

## Dependencies

-   [flutter](https://pub.dev/packages/flutter): The Flutter framework.
-   [web_socket_channel](https://pub.dev/packages/web_socket_channel): Provides the implementation of WebSocketChannel.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
