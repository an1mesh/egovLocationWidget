# Location Widget Code Documentation

This code defines a Flutter application that showcases a location widget with features like searching for countries and customizing its appearance. The code structure, classes, and their functionalities are documented below.

## Main Application

The `main.dart` file is the entry point of the Flutter application. It sets up the main application widget and initializes the state using the `ChangeNotifierProvider`.

### `main()`

- The `main` function is the entry point of the application. It uses `ChangeNotifierProvider` to wrap the entire application, initializing the `UserViewModel` as the application state.

## `MyApp` Class

The `MyApp` class represents the main application widget.

### `MyApp` Constructor

- `const MyApp({super.key})`: The constructor for the `MyApp` widget.

### `build` Method

- `Widget build(BuildContext context)`: This method builds the root of the application, returning a `MaterialApp` widget with a title and theme settings.

## `CountryWidget` Class

The `CountryWidget` class is a stateful widget that represents a country item in the list.

### `CountryWidget` Constructor

- `CountryWidget({super.key, required bool isChecked, required String country})`: The constructor for the `CountryWidget` widget.

### `_CountryWidgetState` Class

- `_CountryWidgetState` is the state class for `CountryWidget`.

### `build` Method

- `Widget build(BuildContext context)`: This method builds the country widget, consisting of a `ListTile` with a `Checkbox`, flag icon, and the country name.

## `HomeScreen` Class

The `HomeScreen` class is a stateful widget representing the main screen of the application.

### `HomeScreen` Constructor

- `const HomeScreen({super.key})`: The constructor for the `HomeScreen` widget.

### `_HomeScreenState` Class

- `_HomeScreenState` is the state class for the `HomeScreen` widget.

### `build` Method

- `Widget build(BuildContext context)`: This method builds the main screen of the application, which includes an app bar, a configurable location widget, and a list of countries. It uses the `Consumer` widget to access the `UserViewModel` for state management.

## `UserViewModel` Class

The `UserViewModel` class is a `ChangeNotifier` that manages the application state.

### Properties

- `isVisible`: A boolean indicating whether the location widget is visible.
- `isRotated`: A boolean indicating whether the location widget is rotated.
- `isClearVisible`: A boolean indicating whether the "Clear All" button is visible.
- `isChecked`: A boolean indicating whether a checkbox is checked.
- `maxHeight`: The maximum height of the location widget.
- `maxWidth`: The maximum width of the location widget.
- `angle`: The rotation angle of the location widget.
- `searchResults`: A list of search results for countries.

### Methods

- `minimizeMaximize()`: Toggles the visibility of the location widget and adjusts its height. Notifies listeners of state changes.
- `rotate()`: Toggles the rotation of the location widget and adjusts its width. Notifies listeners of state changes.
- `searchQuery({required List<String> countries, required String query})`: Filters countries based on the search query and updates the `searchResults` list. Notifies listeners of state changes.
- `clearList()`: Clears the `searchResults` list and hides the "Clear All" button. Notifies listeners of state changes.
- `isClearVisibleCheck(String query)`: Checks whether the "Clear All" button should be visible based on the search query. Notifies listeners of state changes.
- `toggleCheckBox()`: Toggles the checkbox state. Notifies listeners of state changes.


**GitHub Branches**: This project is actively developed on both the `main` and `feature/location_widget` branches on [GitHub](https://github.com/an1mesh/egovLocationWidget).


