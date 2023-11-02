# Products Apps

A take home project.

Supported Devices
-----------------
This app is developed using Flutter, so it can be built to run on both Android and iOS devices.

Supported Features
------------------
The app features include:

-   List of products
-   Filter product by category
-   Search product
-   Infinite Scroll


List of Libraries/Dependencies and their Functionalities
--------------------------------------------------------
The following libraries/dependencies are used in this project:

-   `flutter`: the main SDK for developing Flutter apps
-   `cupertino_icons`: for using iOS-style icons
-   `dio`: for making HTTP requests to fetch data
-   `getx` : for implementing the BLoC pattern for state management
-   `dartz` and `equatable`: for functional programming and immutable objects
-   `flutter_staggered_grid_view`: for show product in grid
-   `cached_network_image`: for loading and caching images
-   `intl`: for formatting currency

Design Pattern / Architectural Pattern
--------------------------------------
Project ini menggunakan **DDD (Domain-Driven-Design)** dan architecture yang digunakan adalah *layered architecture*. Ide utama dari *layered architecture* adalah pemisahan tanggung jawab untuk meningkatkan skalabilitas aplikasi, dimana kode implementasi dari domain dan database tidak digabung dengan kode UI.

Build and Deploy
----------------
To build and deploy the app, follow these steps:

1.  Install Flutter and set up the environment. You can follow the instructions on the Flutter website: <https://flutter.dev/docs/get-started/install>
2.  Clone the repository to your local machine.
3.  Open the project in your preferred IDE.
4.  Run `flutter pub get` to install the dependencies.
5.  Run the app using `flutter run`.

Note: To deploy the app to the app stores, you will need to have developer accounts for both the Apple App Store and Google Play Store, and follow the respective guidelines for submission.