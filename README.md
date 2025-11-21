# AI Image Generator

A Flutter application that generates AI images based on text prompts using a mock API with liquid glass UI design.

## Features

- **Prompt Screen**: Input field for describing what you want to see
- **Result Screen**: Shows loading state, generated image, or error messages  
- **Profile Screen**: User profile with personal information
- **Settings Screen**: App configuration and preferences
- **Mock API**: Simulates AI image generation with 50% error rate and 2-3 second delay
- **Modern UI**: Liquid glass design with light theme
- **State Management**: Flutter BLoC for clean architecture
- **Navigation**: Go Router with glass bottom navigation
- **Animations**: Fade-in animations for better UX

## Architecture

The project follows Clean Architecture principles with proper separation of concerns:

```
lib/
├── core/
│   ├── bloc/                 # App-wide BLoC providers
│   ├── constants/            # App-wide string constants
│   ├── di/                   # Dependency injection
│   ├── navigation/           # Navigation configuration with BLoC
│   │   ├── data/            # Navigation data models
│   │   └── presentation/    # Navigation BLoC and widgets
│   ├── services/             # Services (Logger, Mock API)
│   ├── shared/               # Shared widgets (glass container, buttons)
│   └── theme/                # Theme configuration and styles
└── features/
    ├── image_generation/
    │   ├── data/
    │   │   ├── datasources/  # Data sources (API calls)
    │   │   ├── models/       # Data models
    │   │   └── repositories/ # Repository implementations
    │   ├── domain/
    │   │   ├── entities/     # Business entities
    │   │   ├── repositories/ # Repository interfaces
    │   │   └── usecases/     # Business logic use cases
    │   └── presentation/
    │       ├── bloc/         # Image generation BLoC
    │       ├── view/         # Screens (Prompt, Result)
    │       └── widgets/      # Feature-specific widgets
    │           └── state/    # State-specific widgets
    ├── profile/
    │   ├── data/            # Profile data models
    │   └── presentation/    # Profile BLoC and widgets
    └── settings/
        ├── data/            # Settings data models
        └── presentation/    # Settings BLoC and widgets
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

### Image Generation
1. **Enter Prompt**: On the main screen, enter a description of what you want to see in the text field
2. **Generate**: Tap the "Generate" button to start the image generation process
3. **View Result**: Wait for the loading to complete and see the generated image
4. **Try Again**: Use "Try Another" to generate a new image with the same prompt
5. **New Prompt**: Use "New Prompt" to return to the input screen (your text is saved)
6. **Error Handling**: If generation fails, use "Retry" to try again

### Navigation
- **Bottom Navigation**: Use the glass bottom navigation bar to switch between screens
- **Home**: Image generation feature (Prompt/Result screens)
- **Profile**: View user profile information
- **Settings**: Configure app preferences
- **Add**: Additional features placeholder

## Features Demonstration

The app demonstrates:

- ✅ Input validation (Generate button disabled when field is empty)
- ✅ Loading states with progress indicators
- ✅ Success states with image display
- ✅ Error handling with retry functionality
- ✅ Prompt text persistence when navigating back
- ✅ Light theme with Rubik font
- ✅ Smooth animations and transitions
- ✅ Modern liquid glass UI design
- ✅ Glass bottom navigation bar
- ✅ Adaptive layouts for all screen sizes
- ✅ Clean Architecture with BLoC pattern
- ✅ Multiple screens (Home, Profile, Settings)

## Technical Details

- **State Management**: Flutter BLoC with Equatable for state comparison
- **Navigation**: Go Router with NavigationBloc for declarative routing
- **UI**: Liquid Glass Renderer for modern glass effects with reusable AppGlassContainer
- **Mock API**: 50% error rate simulation with 2-3 second delays
- **Themes**: Light theme with Rubik font family
- **Architecture**: Clean Architecture with complete separation of concerns
- **Dependency Injection**: Custom DI system with GoRouter integration
- **Widget Organization**: Feature-specific widgets with extracted reusable components
- **Code Structure**: Strict adherence to Clean Architecture principles
- **String Management**: Centralized AppStrings constants (no hardcoded text)
- **Type Safety**: No dynamic types, proper Object? usage
- **Adaptive Design**: Responsive layouts using Expanded/Flexible instead of fixed sizes

## Dependencies

- `flutter_bloc: ^9.1.1` - State management
- `equatable: ^2.0.7` - Value equality
- `liquid_glass_renderer: ^0.2.0-dev.4` - Liquid glass UI effects
- `go_router: ^17.0.0` - Navigation
- `cupertino_icons: ^1.0.8` - iOS-style icons

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