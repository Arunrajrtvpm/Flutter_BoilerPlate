# inApp_flutter_boilerplate_app

## Table of contents

- [System requirements](#system-requirements)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 3.4.1 or greater.
Flutter SDK Version 3.22.1 or greater.

### Application structure

After successful build, your application structure should look like this:
├── android - It contains files required to run the application on an Android platform.
├── assets - It contains all images and fonts of your application.
├── ios - It contains files required to run the application on an iOS platform.
├── lib - Most important folder in the application, used to write most of the Dart code..
│ ├── main.dart - Starting point of the application
│ ├── config
│ │ ├── dependency_injection - It contains dependency injection file
│ │ ├── router - It contains the router helper file
│ │ ├── theme - It contains app theme and decoration classes
│ ├── presentation - It contains all UI of your screens
│ ├── data - It contains all the data related files of the application
│ ├── utils - It contains common files and utilities of the application
│ ├── widgets - It contains all custom widget classes

### How to format your code?

V - if your code is not formatted then run following command in your terminal to format code
````
dart format .
````

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

BLoC - State management
https://bloclibrary.dev
//many more


### Support

If you have any problems or questions, reach out to tmo-support@inapp.com