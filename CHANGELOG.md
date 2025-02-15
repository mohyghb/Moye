## 3.2.0
* Use MediaQuery.viewInsetsOf to get the viewInsets of the context instead of MediaQuery.of(context).viewInsets to only rebuild the widget when the viewInsets changes

## 3.1.0
* Introduced ResponsiveAspectRatio - a widget that allows you to adjust the child as the layouts aspect ratio changes

## 3.0.0
* Added documentation to every class
* Updated README.md to have the necessary starter information and showcase this package
* Updated to dart 3

## 2.3.0
* Introduced GradientOverlay - apply gradient overlay on top of your widgets
* Fixed progress button bugs
* Now LinearGradientProgressBar accepts a child
* Added more extensions

## 2.2.1
* Updated Progress button to support filled and filled tonal buttons
* Fixed an issue where popping the context using progress button would cause an error

## 2.2.0
* AutoLayout - fixed a minor bug
* FadeContainer - now supports top fade
* Added border capability for linear gradient progress bar
* Made bottom sheet compatible with keyboard opening

## 2.1.1
* Hotfix - changed the bottom sheet config class fields to be adjustable

## 2.1.0
* Added more extensions
* Added 3 different types of bottom sheet: default, wrap, and scrollable
* Updated progress button to allow for icons and also whether to show the loading progress inside or replace the button

## 2.0.0
* BREAKING CHANGE: removed the camera package from this package. You can utilize the stream_camera_state package instead.
* Added extra functionality for FadeContainer
* Added extra functionality for BackBlurImage
* Added extension for FadeContainer
* Fixed issue with time extension not following the correct readable formats

## 1.1.0
* Added FadeContainer
* Added BackBlurImage
* Added GlowContainer

## 1.0.1
* HotFix for some constants

## 1.0.0
* Introduced Sliver Padding
* Short names for DateTime readable human formats
* Added readable human formats for TimeOfDay
* Added BottomSheet Utils
* Added LinearGradientProgressIndicator
* Added OverlayGlow to add glow to views
* Added ProgressButton
* Minor refactors
* Deprecated Containers and TextFields util classes

## 0.0.6
* Added String extensions (capitalize and title casing)
* Updated the package in general for small improvements

## 0.0.5
* Added DateTime extensions (readable date time format)
* Added more constants (compatible with slivers)
* Added more widget extensions

## 0.0.4
* Added sliver extensions - to convert easily between normal widgets to sliver widgets
* Added pre-defined constants for padding, heightBox, and widthBox
* Added smart camera state for handling init and dispose of camera controllers
* Added validation helper for validating emails, names, and numbers
* Added more getters for context extension

## 0.0.3
* Added more extensions and utils
* Breaking-Change - changed the location of various files in the package 

## 0.0.2
* Added repository address in the project pubspec file

## 0.0.1
* Added extensions for widgets (makes it easier to manage different widgets)
* Added extensions for numbers (to define height and width boxes and EdgeInset objects easily)
* Added null safety extensions (allows the developer to use some Kotlin style "let" function on any object)
