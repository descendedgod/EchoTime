
# Echotime World Clock

A modern, dark "hacker" themed Flutter app that displays the current time for any city in the world. Features neon green accents, monospaced font, and global city selection with time zone support.

![Screenshot](image.png)

## Features
- Dark hacker theme (black/charcoal background, neon green accent)
- Monospaced font (Roboto Mono)
- Select from all cities worldwide
- Shows current time, city name, and time difference from local time
- City selection screen with search and instant filtering
- Responsive UI for Android/iOS
- State management with Provider
- Internationalization and time zone support

## Getting Started
1. Install [Flutter](https://docs.flutter.dev/get-started/install) and set up your device/emulator.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Run the app: `flutter run`

## Folder Structure
- `lib/` - Main app code
- `assets/` - Fonts and other assets

## Customization
- Replace placeholder assets as needed.
- To add/remove cities, update `lib/utils/city_list.dart`. For all cities, the app uses the IANA time zone database and includes every city with a time zone entry.

## Credits
- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider)
- [intl](https://pub.dev/packages/intl)
- [timezone](https://pub.dev/packages/timezone)
- [Roboto Mono font](https://fonts.google.com/specimen/Roboto+Mono)

## License
MIT
