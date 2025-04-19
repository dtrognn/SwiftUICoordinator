# SwiftUI + Coordinator Pattern Example

This project showcases the integration of SwiftUI with the Coordinator pattern to create a scalable and modular navigation system. It includes a custom base screen built from `UIViewController` and supports per-screen rotation configurations.

### Features
- SwiftUI + Coordinator Pattern: Combines SwiftUI for the user interface with the Coordinator pattern for navigation management.

- Custom Base Screen: Implements a reusable base screen derived from UIViewController to handle shared functionalities.

- Per-Screen Rotation Support: Enables individual screens to specify their supported orientations (e.g., portrait, landscape).

### Project Structure

- **Coordinators**: Classes managing navigation logic.

    - `AppCoordinator.swift`: Oversees the app's main navigation flow.

    - `HomeCoordinator.swift`: Manages navigation within the Home section.

    - `ProfileCoordinator.swift`: Handles navigation within the Profile section.

- **Views**: SwiftUI views for the app's screens.

    - `HomeView.swift`: Main view for the Home section.

    - `ProfileView.swift`: Main view for the Profile section.

- **Utilities**: Supporting classes and configurations.

    - `BaseNavigationController.swift`: Custom navigation controller with rotation support.

    - `ScreenConfiguration.swift`: Defines screen-specific settings.

### Installation

1. Clone the repository:

```bash
git clone https://github.com/dtrognn/SwiftUICoordinator.git
```

2. Open the project in Xcode:

```bash
cd your-repo-name
open YourProject.xcodeproj
```

3. Build and run the project on a simulator or device.

### Usage

- The app uses coordinators to manage navigation between screens, starting from a root coordinator (`AppCoordinator`).

- Each screen leverages the custom base screen for consistent behavior and can define its own rotation settings via `ScreenConfiguration`.

- Navigation is handled programmatically by coordinators, ensuring a clean separation of concerns from the SwiftUI views.
