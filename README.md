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