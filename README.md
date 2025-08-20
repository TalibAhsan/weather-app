
# Weather App

A simple Flutter weather app that fetches and displays current weather data using OpenWeatherMap API and device location.

## Features
- Get current location using device GPS
- Fetch weather data from OpenWeatherMap
- Display weather info and emoji based on conditions
- Simple UI with a 'Get Location' button
- Navigation to weather details screen

## Getting Started

### Prerequisites
- Flutter SDK
- Android/iOS emulator or device

### Setup
1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Make sure your `pubspec.yaml` does not reference missing assets
4. Update your Android NDK version in `android/app/build.gradle.kts` if needed

### Usage
- Run the app with `flutter run`
- Click the 'Get Location' button to fetch weather data

## Dependencies
- [geolocator](https://pub.dev/packages/geolocator) for location
- [http](https://pub.dev/packages/http) for API calls

## Notes
- Make sure location permissions are granted on your device/emulator
- You can customize weather display and add more features as needed

## License
MIT
