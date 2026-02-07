# 📚 Book Store App

A beautiful and feature-rich Flutter book store application with cart management, favorites, search functionality, and persistent data storage.

## ✨ Features

### Core Functionality
- **Browse Books**: View curated collections of recommended and best-selling books
- **Book Details**: Comprehensive book information including title, author, description, rating, and price
- **Shopping Cart**: Add books to cart with smart quantity management
  - Automatic quantity increment for duplicate items
  - Increase/decrease quantities
  - Total price calculation
  - Clear cart functionality
- **Favorites**: Save favorite books for quick access
- **Search**: Real-time search by book title or author
- **View All**: Browse complete catalogs of recommended and best-selling books
- **Persistent Storage**: Cart and favorites automatically saved and restored between app sessions

### User Interface
- **Modern Design**: Clean, intuitive interface with smooth animations
- **Navigation**:
  - Bottom navigation bar for quick access to main sections
  - Drawer menu with comprehensive navigation options
  - Seamless screen transitions
- **Empty States**: Helpful messages and call-to-action buttons when cart or favorites are empty
- **Error Handling**: Graceful fallbacks for missing or broken images
- **Notifications & Profile**: Dedicated screens for user notifications and profile management

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── components/          # Reusable UI components
│   ├── best_selling_card.dart
│   └── book_card.dart
├── models/             # Data models
│   ├── book_data.dart
│   └── cart_item.dart
├── screens/            # Application screens
│   ├── book_list_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   ├── details_screen.dart
│   ├── favourit_screen.dart
│   ├── home_screen.dart
│   ├── notification_screen.dart
│   ├── profile_screen.dart
│   ├── search_screen.dart
│   └── splash_screen.dart
├── services/           # Business logic & data services
│   ├── book_service.dart
│   └── storage_service.dart
├── utils/              # Utilities & state management
│   ├── book_provider.dart
│   └── clipper.dart
└── main.dart           # App entry point
```

### State Management
- **Provider Pattern**: Uses the `provider` package for efficient state management
- **BookProvider**: Centralized state management for cart and favorites
- **Reactive UI**: Automatic UI updates when data changes

### Data Persistence
- **SharedPreferences**: Local storage for cart and favorites
- **JSON Serialization**: Efficient data storage and retrieval
- **Automatic Save**: Changes saved immediately on user actions
- **Load on Startup**: Data restored seamlessly when app launches

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.5.4 or higher)
- Dart SDK (version 3.5.4 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yacine-Youb/book_store_app.git
   cd book_store_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Release

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2              # State management
  shared_preferences: ^2.3.3    # Local storage
  hugeicons: ^0.0.7            # Icon library

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0        # Linting rules
```

## 🎯 Key Features Implementation

### Smart Cart Management
- **Duplicate Prevention**: Adding the same book increments quantity instead of creating duplicates
- **Quantity Controls**: Intuitive +/- buttons for each item
- **Price Calculation**: Real-time total price updates
- **Persistent Cart**: Cart contents saved automatically and restored on app restart

### Favorites System
- **Toggle Favorites**: Easy add/remove favorite books from any screen
- **State Persistence**: Favorite icon shows correct state across navigation
- **Local Storage**: Favorites persist between app sessions

### Search Functionality
- **Real-time Filtering**: Results update as you type
- **Multi-field Search**: Search by both title and author
- **Empty States**: Clear messaging when no results found

### Data Persistence
- **Automatic Saving**: No manual save required
- **Restore on Launch**: Data loaded before UI renders
- **Error Handling**: Graceful handling of corrupted data

## 🎨 UI/UX Highlights

- **Material Design**: Follows Material Design 3 guidelines
- **Responsive Layout**: Adapts to different screen sizes
- **Smooth Animations**: Polished transitions and interactions
- **Loading States**: Clear feedback during operations
- **Error States**: User-friendly error messages
- **Empty States**: Helpful guidance when no data available

## 🧪 Testing

### Manual Testing Checklist
See [TESTING_GUIDE.md](TESTING_GUIDE.md) for comprehensive testing procedures.

### Automated Testing
```bash
flutter test
```

## 📝 Code Quality

- **Dart Lints**: Follows official Dart linting rules
- **Code Formatting**: Consistent formatting using `dart format`
- **Clean Architecture**: Clear separation of concerns
- **Error Handling**: Comprehensive error handling throughout
- **Performance**: Optimized with const constructors and efficient state management

## 🔄 Version History

### v1.0.0 (February 6, 2026)
- ✅ Initial release
- ✅ Complete book browsing functionality
- ✅ Shopping cart with quantity management
- ✅ Favorites system
- ✅ Search functionality
- ✅ Data persistence
- ✅ All major features implemented

## 🚧 Future Enhancements

- [ ] User authentication & accounts
- [ ] Real payment gateway integration
- [ ] Order history tracking
- [ ] Book reviews and ratings
- [ ] Wishlist sharing
- [ ] Push notifications
- [ ] Backend API integration
- [ ] Advanced filtering options
- [ ] Reading lists and collections

## 🐛 Known Issues

- Checkout screen is currently a placeholder (payment integration pending)
- Book catalog is hardcoded (backend integration planned)

## 📄 License

This project is available for educational and portfolio purposes.

## 👤 Author

**Yacine Youb**
- GitHub: [@Yacine-Youb](https://github.com/Yacine-Youb)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Provider package maintainers
- Book cover images (for demonstration purposes)

## 📚 Documentation

- [Refactoring Plan](REFACTORING_PLAN.md) - Detailed development roadmap
- [Implementation Issues](IMPLEMENTATION_ISSUES.md) - Initial codebase analysis
- [Testing Guide](TESTING_GUIDE.md) - Comprehensive testing procedures

---

**Made with ❤️ using Flutter**
