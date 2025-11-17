# 🧮 Smart Calculator

<img src="assets/images/app_icon.png" width="100" alt="App logo">

A comprehensive Flutter application that combines a powerful calculator with multiple unit converters, providing users with essential mathematical and conversion tools in one convenient app, built with Clean Architecture principles and featuring a stunning UI.

## 📱 Screenshots

<!-- Add your screenshots here -->

<div align="center">

  <img src="screenshots/screenshot-1.jpg" width="200" alt="Home page"/>
  <img src="screenshots/screenshot-2.jpg" width="200" alt="Calculator interface"/>
  <img src="screenshots/screenshot-3.jpg" width="200" alt="Converter selection"/>
  <img src="screenshots/screenshot-4.jpg" width="200" alt="Conversion result"/>
</div>

## ✨ Features

- 🧮 **Advanced Calculator**: Perform basic and advanced mathematical operations
- 🔄 **Multiple Converters**: Convert between various units (Volume, Data, Age, Discount, Time, Temperature)
- ✅ **Input Validation**: Smart validation for accurate calculations and conversions
- 🎨 **Beautiful UI**: Clean, modern interface with intuitive design
- 📱 **Responsive Design**: Adaptive UI that works seamlessly across different screen sizes
- ⚡ **Fast & Efficient**: Optimized performance with proper state management
- 🏗️ **Clean Architecture**: Well-structured codebase following Clean Architecture principles

## 🎨 Design

- **Color Scheme**: Modern theme with elegant styling
- **Typography**: Poppins font family for a modern, clean look
- **Material Design**: Latest Material Design guidelines
- **Smooth Interactions**: Engaging user experience with responsive feedback

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                 # App-wide configurations (themes, etc.)
├── data/
│   ├── models/           # Data models
│   └── repositories/     # Repository implementations
├── domain/
│   ├── entities/         # Domain entities
│   ├── repositories/     # Repository interfaces
│   └── usecases/         # Business logic use cases
└── presentation/
    ├── controller/       # State management controllers
    ├── Screen/           # UI screens
    └── widgets/          # Reusable UI components
```

### Architecture Layers

1. **Domain Layer**: Contains business logic, entities, and repository interfaces
2. **Data Layer**: Implements repositories and handles data operations
3. **Presentation Layer**: UI components, state management, and user interactions

## 🛠️ Technologies & Packages

- **Flutter SDK**: ^3.9.2
- **GetX**: ^4.7.2 - State management
- **Sqflite**: ^2.4.2 - Local database
- **Flutter SVG**: ^2.2.2 - SVG icon support
- **Clean Architecture**: Design pattern for maintainable code

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator / iOS device or simulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/smart_calculator.git
   cd smart_calculator
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📖 How to Use

### Calculator
1. **Launch the app** and navigate to the Calculator tab
2. **Enter numbers** using the keypad
3. **Use operators** (+, -, ×, ÷) to build expressions
4. **Tap "="** to calculate the result
5. **Use AC** to clear all input or backspace to delete last character

### Converters
1. **Navigate to Converter tab**
2. **Select a converter** (Volume, Data, Age, Discount, Time, Temperature)
3. **Enter input value** and select units
4. **View instant conversion** results

### Input Validation

The app includes smart validation:

- ✅ Required fields must be filled
- ✅ Valid number inputs
- ✅ Proper unit selections
- ❌ Error messages guide you if validation fails

## 🎯 Key Features Explained

### Calculator Operations

Supports basic arithmetic, percentages, and decimal calculations with real-time expression display.

### Unit Conversions

Comprehensive converters for:
- **Volume**: Liters, gallons, milliliters, etc.
- **Data**: Bytes, KB, MB, GB, TB
- **Age**: Years, months, days calculations
- **Discount**: Percentage discounts and final prices
- **Time**: Hours, minutes, seconds conversions
- **Temperature**: Celsius, Fahrenheit, Kelvin

### State Management

Implements GetX pattern for efficient state management across calculator and converter functionalities.

### Theme System

Comprehensive theme with:
- Custom color scheme
- Poppins font family
- Consistent styling across all components

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for design guidelines
- Clean Architecture principles
- GetX contributors for state management
- SVG icon contributors

## 📞 Support

If you have any questions or need help, please open an issue in the GitHub repository.

---

<p align="center">Made with ❤️ using Flutter</p>
