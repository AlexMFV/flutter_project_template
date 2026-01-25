# Flutter Project Template

A production-ready Flutter project template featuring a complete MVVM architecture with Riverpod state management, navigation, theming, internationalization, and comprehensive error handling with messaging system.

## 📋 Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Core Components](#core-components)
- [Usage Examples](#usage-examples)
- [Configuration](#configuration)
- [Contributing](#contributing)

## ✨ Features

### 🔄 State Management (Riverpod)
- **flutter_riverpod** (v3.1.0) with modern provider-based architecture
- **riverpod_annotation** for code generation support
- Centralized provider management in `service_providers.dart`
- Reactive state updates across the application

### 🧭 Navigation System
- Custom `NavigationService` for programmatic navigation
- Centralized route management via `navigation_routes.dart`
- Support for named routes with arguments
- Navigation methods: `navigateTo()`, `replace()`, `goBack()`

### 🎨 Theming
- Complete light and dark theme support
- Centralized color palette in `AppColors`
- Custom `AppTheme` with Material Design 3 support
- Dynamic theme switching via `ThemeViewModel`
- Persistent theme preferences

### 🌍 Internationalization (i18n)
- Built-in localization using Flutter's `intl` package
- Auto-generated localization classes
- Support for multiple languages (English and Portuguese included)
- Easy locale switching with `L10nViewModel`
- ARB format for translation files

### 💬 Messaging & Error Handling
- Comprehensive message system with 4 types: Success, Info, Warning, Error
- Automatic SnackBar display for user feedback
- Message listener system with `listenToMessages()`
- Integrated error logging with `LoggerService`
- Stack trace capture for debugging
- Context-aware message display with theming

## 📁 Project Structure

```
lib/
├── app/
│   └── main.dart                      # Application entry point
│
├── core/
│   ├── constants/
│   │   └── navigation_routes.dart     # Route name constants
│   │
│   ├── extensions/
│   │   ├── l10n_ext.dart             # Localization extensions
│   │   ├── message_color_ext.dart    # Message color theming
│   │   ├── message_l10n_ext.dart     # Message translations
│   │   └── ref_message_ext.dart      # WidgetRef message helper
│   │
│   ├── logging/
│   │   └── logger.dart               # Logging service
│   │
│   ├── messages/
│   │   ├── app_messages.dart         # Message model
│   │   ├── message_key.dart          # Message key enum
│   │   └── message_types.dart        # Message type enum
│   │
│   ├── services/
│   │   ├── navigation_service.dart   # Navigation logic
│   │   └── service_providers.dart    # Riverpod providers
│   │
│   ├── themes/
│   │   ├── colors.dart               # Color palette
│   │   └── theme.dart                # Theme definitions
│   │
│   ├── ui/
│   │   └── message_listener.dart     # Message display handler
│   │
│   └── utils/
│       └── utils_go_here.txt         # Utility functions placeholder
│
├── l10n/
│   ├── app_en.arb                    # English translations
│   ├── app_pt.arb                    # Portuguese translations
│   ├── app_localizations.dart        # Generated localization class
│   ├── app_localizations_en.dart     # English implementation
│   └── app_localizations_pt.dart     # Portuguese implementation
│
├── viewmodels/
│   ├── base_viewmodel.dart           # Base ViewModel with common logic
│   ├── home_viewmodel.dart           # Home page business logic
│   ├── l10n_viewmodel.dart           # Localization state
│   └── theme_viewmodel.dart          # Theme state
│
├── views/
│   ├── pages/
│   │   ├── home_page.dart            # Home page UI
│   │   └── splash_page.dart          # Splash screen
│   │
│   └── widgets/
│       └── widgets_go_here.txt       # Reusable widgets placeholder
│
└── mvvm_guide.txt                    # MVVM architecture guide
```

## 🏗️ Architecture

This template follows the **MVVM (Model-View-ViewModel)** pattern with clear separation of concerns:

### Architectural Guidelines

From `mvvm_guide.txt`:

1. **Pages** wire UI to ViewModels
2. **Widgets** stay reusable and logic-free
3. **ViewModels** own state and UI rules
4. **Models** stay pure data
5. **Utils** hold pure shared functions
6. **Services** handle state, IO, and platform access
7. **Extensions** improve readability without hiding logic
8. **Constants** replace random globals

### Layer Responsibilities

#### View Layer (`views/`)
- **Pages**: Full-screen UI components that consume ViewModels
- **Widgets**: Reusable, stateless UI components
- No business logic, only UI rendering and user interaction

#### ViewModel Layer (`viewmodels/`)
- Business logic and state management
- Extends `BaseViewModel` for common functionality
- Emits messages for user feedback
- Handles navigation through `NavigationService`

#### Core Layer (`core/`)
- **Services**: Platform-specific logic (navigation, logging)
- **Messages**: User feedback system
- **Themes**: Visual styling
- **Extensions**: Convenience methods
- **Constants**: App-wide constants

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (^3.7.0) - Required for Riverpod code generation
- (Optional) FVM for Flutter version management

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AlexMFV/flutter_project_template.git
   cd flutter_project_template
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run code generation (if using Riverpod generators)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Using FVM (Optional)

To use a specific Flutter version with FVM:
```bash
fvm use <flutterVersion> --force
fvm flutter run
```

## 🔧 Core Components

### 1. State Management with Riverpod

**Provider Setup** (`service_providers.dart`):
```dart
final homeVMProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final nav = ref.read(navProvider);
  final logger = ref.read(loggerProvider);
  return HomeViewModel(nav, logger);
});
```

**Consuming Providers**:
```dart
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(homeVMProvider);
    // Use the ViewModel
  }
}
```

### 2. BaseViewModel

All ViewModels extend `BaseViewModel` which provides:

- **Message emission**: `success()`, `info()`, `warn()`, `fail()`
- **Navigation**: `navigateTo()`, `replaceWith()`, `goBack()`
- **Logging**: Integrated `LoggerService`
- **Lifecycle**: `ChangeNotifier` for reactive updates

**Example ViewModel**:
```dart
class HomeViewModel extends BaseViewModel {
  HomeViewModel(super.navigation, super.logger);

  Future<void> loadData() async {
    try {
      // Business logic here
      success(MessageKey.sampleSuccess);
    } catch (e, st) {
      fail(MessageKey.sampleError, error: e, stackTrace: st);
    }
  }
}
```

### 3. Message System

**Message Types**:
- `MessageType.success` - Green SnackBar
- `MessageType.info` - Blue SnackBar  
- `MessageType.warning` - Orange SnackBar
- `MessageType.error` - Red SnackBar (with error logging)

**Using Messages in Pages**:
```dart
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(homeVMProvider);
    ref.listenMessages(homeVMProvider, context); // Auto-display messages
    
    return Scaffold(/* UI */);
  }
}
```

**Adding New Messages**:

1. Add key to `message_key.dart`:
   ```dart
   enum MessageKey {
     sampleError,
     sampleWarning,
     sampleInfo,
     sampleSuccess,
     yourNewMessage, // Add here
   }
   ```

2. Add translations to ARB files:
   ```json
   {
     "yourNewMessage": "Your message text here"
   }
   ```

3. Emit from ViewModel:
   ```dart
   success(MessageKey.yourNewMessage);
   ```

### 4. Navigation Service

**Adding Routes**:

1. Define in `navigation_routes.dart`:
   ```dart
   class Routes {
     static const String HOMEPAGE = '/home';
     static const String NEWPAGE = '/newpage';
   }
   ```

2. Register in `main.dart`:
   ```dart
   routes: {
     Routes.HOMEPAGE: (_) => HomePage(),
     Routes.NEWPAGE: (_) => NewPage(),
   }
   ```

3. Navigate from ViewModel:
   ```dart
   navigateTo(Routes.NEWPAGE, args: someData);
   ```

### 5. Theming

**Theme Toggle**:
```dart
final themeVm = ref.read(themeVMProvider);
themeVm.toggleTheme(); // Switch between light/dark
```

**Adding Colors** (`colors.dart`):
```dart
class AppColors {
  static const Color primary = Color(0xFF6200EE);
  static const Color yourNewColor = Color(0xFF123456);
}
```

### 6. Internationalization

**Adding a New Language**:

1. Create `lib/l10n/app_<locale>.arb` (e.g., `app_es.arb`)
2. Add translations matching keys from `app_en.arb`
3. Run `flutter gen-l10n` to generate classes

**Switching Locale**:
```dart
final localeVm = ref.read(localeViewModelProvider);
localeVm.setLocale(Locale('pt')); // Switch to Portuguese
```

**Using Translations**:
```dart
// In widgets with BuildContext:
context.l10n.sampleSuccess

// In ViewModels (for message keys):
MessageKey.sampleSuccess // Auto-translated by message system
```

### 7. Logging

**LoggerService** provides three levels:

```dart
logger.info('Informational message');
logger.warning('Warning message');
logger.error('Error occurred', error: e, stackTrace: st);
```

Logs appear in the console with appropriate severity levels and stack traces when provided.

## 📝 Usage Examples

### Creating a New Feature

1. **Create ViewModel** (`viewmodels/feature_viewmodel.dart`):
   ```dart
   class FeatureViewModel extends BaseViewModel {
     FeatureViewModel(super.nav, super.logger);
     
     Future<void> performAction() async {
       try {
         // Your logic
         success(MessageKey.actionSuccess);
       } catch (e, st) {
         fail(MessageKey.actionError, error: e, stackTrace: st);
       }
     }
   }
   ```

2. **Register Provider** (`service_providers.dart`):
   ```dart
   final featureVMProvider = ChangeNotifierProvider<FeatureViewModel>((ref) {
     return FeatureViewModel(
       ref.read(navProvider),
       ref.read(loggerProvider),
     );
   });
   ```

3. **Create Page** (`views/pages/feature_page.dart`):
   ```dart
   class FeaturePage extends ConsumerWidget {
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final vm = ref.read(featureVMProvider);
       ref.listenMessages(featureVMProvider, context);
       
       return Scaffold(
         appBar: AppBar(title: Text('Feature')),
         body: Center(
           child: ElevatedButton(
             onPressed: vm.performAction,
             child: Text('Perform Action'),
           ),
         ),
       );
     }
   }
   ```

4. **Add Route and Navigation** (see Navigation section above)

## ⚙️ Configuration

### Dependencies (`pubspec.yaml`)

**Core Dependencies**:
- `flutter_riverpod: ^3.1.0` - State management
- `riverpod_annotation: ^4.0.0` - Code generation support
- `flutter_localizations` - Internationalization
- `intl: 0.19.0` - Internationalization support

**Dev Dependencies**:
- `flutter_lints: ^5.0.0` - Linting rules
- `build_runner` - Code generation
- `riverpod_generator: ^4.0.0` - Riverpod code generation

### Flutter Configuration

```yaml
flutter:
  generate: true  # Enable localization generation
  uses-material-design: true
```

## 🎯 Key Features Demonstrated

### Home Page Example

The included `HomePage` demonstrates all core features:

- **State Management**: Uses `homeVMProvider` to access ViewModel
- **Message Listening**: `ref.listenMessages()` displays feedback
- **Error Handling**: Error button throws exception with proper logging
- **Success/Info/Warning**: Buttons trigger different message types
- **ViewModel Integration**: Business logic separated from UI

## 📚 Best Practices

1. **Keep ViewModels Pure**: No Flutter/UI dependencies in ViewModels
2. **Use Extensions Wisely**: Only for enhancing readability
3. **Centralize Constants**: All routes, strings, and config in core/
4. **Message Keys**: Always use enum keys, never hardcoded strings
5. **Error Logging**: Always log errors with stack traces
6. **Theme Consistency**: Use `AppColors` for all colors
7. **Localization**: All user-facing strings should be translatable

## 🤝 Contributing

1. Follow the existing MVVM structure
2. Add message keys for new user feedback
3. Update ARB files for new translatable strings
4. Register new providers in `service_providers.dart`
5. Keep widgets reusable and logic-free
6. Document new features in this README

## 📄 License

This is a template project. Use it as you see fit for your projects.

## 🔗 Related Files

- `mvvm_guide.txt` - Quick reference for MVVM principles
- `use FVM.txt` - Instructions for Flutter version management

---

**Note**: This template uses `talk2me` as a placeholder package name. Update all imports to match your project name after cloning.
