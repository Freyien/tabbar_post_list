# About Versions

- Flutter: 3.22
- Dart 3.4

# Run on
- Android
- iOS

# To build and run this project:

1. Get Flutter [here](https://flutter.dev) if you don't already have it
2. Clone this repository.
3. `cd` into the repo folder.
4. run `flutter run`

# To run tests (Unit and Widget)
1. run `flutter test`

# To know coverage
1. install lcov
    - For linux run 
        - `sudo apt-get update -qq -y`
        - `sudo apt-get install lcov -y`
    - For mac run `brew install lcov`
3. `cd` into the repo folder.
4. run `flutter test --coverage`
5. run `genhtml coverage/lcov.info -o coverage/html`
6. open file `coverage/html/index.html`