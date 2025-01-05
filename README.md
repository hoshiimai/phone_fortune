# Call Mobile

- This is project about....

# IDE

- Android Studio Giraffe | 2022.3.1 Patch 4 or newer
- Flutter: 3.19.4

# Package Dependencies

- Firebase

# Gen build

# Build Icon

- flutter pub run flutter_launcher_icons:main

# Build Asset

- flutter pub run assets_gen build

# Build Service

- flutter pub run build_runner build --delete-conflicting-outputs

# Build App Bundle

- flutter build appbundle --dart-define=FLAVOR=prod
- flutter build apk --dart-define=FLAVOR=prod

# Folder Structure

- 📂 core
    - 📂 api - Definitions of all API requests
    - 📂 managers - Classes for manager services
    - 📂 model
        - 📂 argument - Definitions of route arguments
        - 📂 business - Definitions of data models related to business logic
        - 📂 request - Request data models for the Retrofit API
        - 📂 response - Response data models for the Retrofit API
    - 📂 repository - Data repositories
- 📂 locale
    - Language string mapper
- 📂 ui
    - 📂 common - Common screens/pages shared throughout the app
    - 📂 base - Base UI classes
    - 📂 creator - Screens/pages for Creator/Idol role
    - 📂 fan - Screens/pages for Fan role
    - 📂 [Page] - Template for a page folder in the UI folder
        - 📂 binding - Bindings
        - 📂 components - Widgets/components of the page
        - 📂 interactor - Includes BloC classes, Events, and States
    - 📂 routings - Definitions of app routes
    - 📂 widgets - Widgets used across multiple UI pages
- 📂 utils
    - 📂 extensions - Extends existing functionality of some common Flutter classes
    - 📂 helper - Various helper classes
    - Utility classes/functions used throughout the app 