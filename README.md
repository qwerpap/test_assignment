# AI Image Generator

A Flutter application that generates AI images based on text prompts using a mock API with liquid glass UI design.

## Features

- **Prompt Screen**: Input field for describing what you want to see
- **Result Screen**: Shows loading state, generated image, or error messages
- **Mock API**: Simulates AI image generation with 50% error rate and 2-3 second delay
- **Modern UI**: Liquid glass design with light/dark theme support
- **State Management**: Flutter BLoC for clean architecture
- **Navigation**: Go Router for smooth transitions
- **Animations**: Fade-in animations for better UX

## Architecture

The project follows Clean Architecture principles with proper separation of concerns:

```
lib/
├── core/
│   ├── bloc/                 # App-wide BLoC providers
│   ├── di/                   # Dependency injection
│   ├── navigation/           # Navigation configuration
│   ├── services/             # Services (Logger, Mock API)
│   ├── shared/               # Shared widgets
│   └── theme/                # Theme configuration, storage and BLoC
└── features/
    └── image_generation/
        ├── data/
        │   ├── datasources/  # Data sources (API calls)
        │   ├── models/       # Data models
        │   └── repositories/ # Repository implementations
        ├── domain/
        │   ├── entities/     # Business entities
        │   ├── repositories/ # Repository interfaces
        │   └── usecases/     # Business logic use cases
        └── presentation/
            ├── bloc/         # Image generation BLoC
            ├── view/         # Screens (Prompt, Result)
            └── widgets/      # Feature-specific widgets
                └── state/    # State-specific widgets
```

### Architecture Layers

- **Domain Layer**: Contains business entities, repository interfaces, and use cases
- **Data Layer**: Implements repositories, handles data sources and models
- **Presentation Layer**: Contains UI components, BLoCs, and widgets
- **Core Layer**: Shared utilities, services, themes, and dependency injection

## Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK
- iOS Simulator/Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd test_assignment
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Usage

1. **Enter Prompt**: On the main screen, enter a description of what you want to see in the text field
2. **Generate**: Tap the "Generate" button to start the image generation process
3. **View Result**: Wait for the loading to complete and see the generated image
4. **Try Again**: Use "Try Another" to generate a new image with the same prompt
5. **New Prompt**: Use "New Prompt" to return to the input screen (your text is saved)
6. **Error Handling**: If generation fails, use "Retry" to try again

## Features Demonstration

The app demonstrates:

- ✅ Input validation (Generate button disabled when field is empty)
- ✅ Loading states with progress indicators
- ✅ Success states with image display
- ✅ Error handling with retry functionality
- ✅ Prompt text persistence when navigating back
- ✅ Dark/Light theme toggle
- ✅ Smooth animations and transitions
- ✅ Modern liquid glass UI design

## Technical Details

- **State Management**: Flutter BLoC with Equatable for state comparison
- **Navigation**: Go Router for declarative routing
- **UI**: Liquid Glass Renderer for modern glass effects
- **Mock API**: 50% error rate simulation with 2-3 second delays
- **Themes**: Light and dark theme support with smooth transitions
- **Architecture**: Clean Architecture with separation of concerns
- **Dependency Injection**: Custom DI system for managing dependencies
- **Widget Organization**: Feature-specific widgets separated into reusable components
- **Code Structure**: Following example_lib patterns with proper layering

## Dependencies

- `flutter_bloc: ^9.1.1` - State management
- `equatable: ^2.0.7` - Value equality
- `liquid_glass_renderer: ^0.2.0-dev.4` - Liquid glass UI effects
- `go_router: ^14.6.1` - Navigation

## Performance Notes

The liquid glass effects are computationally intensive. The app is optimized for:
- Minimal glass layers
- Efficient texture caching
- Smooth animations without jank
- Proper memory management

## Testing

The app includes error simulation to test error handling:
- ~50% of generation requests will fail
- Error messages are displayed with retry options
- Network image loading errors are handled gracefully

## Platform Support

- ✅ iOS (Impeller renderer required for liquid glass effects)
- ✅ Android (Impeller renderer required for liquid glass effects)
- ❌ Web (Not supported by liquid_glass_renderer)
- ❌ Desktop (Not supported by liquid_glass_renderer)

## License

This project is created for demonstration purposes.