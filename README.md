# Moye

A streamlined Flutter package designed to minimize the code required for creating stunning user interfaces.

<img src="https://github.com/mohyghb/Moye/assets/37986616/0c7e7f50-f139-4594-b0a7-1617fb39172a" width="200"/>


# Extensions

Tired of wrapping your widgets inside a Expand widget to make them expanded? You can use the `expanded` widget to avoid wrapping multiple layers of widgets around your widget and make it more readable.

```dart
// Before
Expanded(child: YourCustomWidget())

// After
YourCustomWidget().expanded
```

Extensions don't end there. You can also recursively call extensions on extensions to achieve the UI you desire and make your code more readable. For example:

```dart
// Before
Column(
  children: [
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text('Test'),
          ),
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('Test'),
          ),
        ),
      ),
    )
  ],
);
```

```dart
// After using extensions
Column(
  children: [
    Container(
      child: Text('Test').alignTop,
    ).withPadding(s16Padding).expanded,
    Container(
      child: Text('Test').alignRight,
    ).withPadding(s8Padding).expanded,
  ],
);
```

As you saw from the code above, you can use the pre-defined constants in Moye for padding, dimensions, and spaces. Moye currently has lots of extensions to meet your demands, however, please open a new request if your use-case has not been covered yet.


## Constants

Pre-defined constants in Moye allow you to easily integrate them with your projects and keep it clean.

#### Padding Constants
High usage padding patterns has been covered in this package. You can see the difference between before and after here:

```dart
// Before

1. const EdgeInsets.all(8)
2. const EdgeInsets.symmetric(vertical: s8)
3. const EdgeInsets.symmetric(horizontal: s8)

// After

1. s8Padding
2. s8VerticalPadding
3. s8HorizontalPadding
```

#### Box constants
Boxes allow you to define spaces between different widgets.

```dart
// Before

1. SizedBox()
2. SizedBox(width: 8)
3. SizedBox(height: 8)

// After

1. empty
2. s8WidthBox
3. s8HeightBox
```

# Gradient Overlay

Add gradient overlays on top of your widgets to make them unique. You can apply these shaders on top of Text, Image, and any widget that you currently have. Gradient overlay also has an extension which can easily be invoked on any widget!

<img src="https://github.com/mohyghb/Moye/assets/37986616/e71543f0-e31e-42be-b705-2555686ec7d8"/>


```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Gradient Overlay', style: context.textTheme.headlineLarge.bold),
    s8HeightBox,
    Text('Here is how gradient overlay looks' * 5)
  ],
).withGradientOverlay(
  gradient: LinearGradient(
    colors: [
      context.colorScheme.primary,
      context.colorScheme.tertiary,
      context.colorScheme.primary,
    ],
  ),
)
```

# Glow Container

Add a backdrop glow to any widget of your choice. Enhances your UI/UX and makes it more futurisic! You can customize the color, blur radius, and spared radius, and it comes with its own extension!

<img src="https://github.com/mohyghb/Moye/assets/37986616/dc2d2331-7bbe-4a4a-b127-79796092757e"/>

```dart
YourWidget().withGlowContainer(blurRadius: 10)
```

# Linear Gradient Progress Bar
Make your linear progress bars support both gradient colors and a back glow!

<img src="https://github.com/mohyghb/Moye/assets/37986616/ea701145-90db-48fb-bad4-20ec28c5d885"/>

```dart
LinearGradientProgressBar(
  value: 0.3,
  borderRadius: BorderRadius.circular(56),
  gradient: LinearGradient(
    colors: [
      context.colorScheme.primary,
      context.colorScheme.tertiary,
    ],
  ),
)
```

# Progress Button
Show a feedback to your user while performing an action and debounce any incoming presses onto the button for that duration.

<img src="https://github.com/mohyghb/Moye/assets/37986616/24bc8616-b7f5-4e85-b75b-b6b707677843"/>

```dart
ProgressButton(
  onPressed: () async {
    await Future.delayed(const Duration(seconds: 1));
  },
  child: const Text('Progress button - inside loading'),
  icon: Icon(Icons.send),
)
```

# BottomSheet Utils
Easily show 3 different types of bottom sheets: default, wrap, and scrollable.

<img src="https://github.com/mohyghb/Moye/assets/37986616/2216eb13-ef74-4faa-949b-400910bc9bfb"/>

```dart
BottomSheetUtils.showBottomSheet(
  context: context,
  borderRadius: BorderRadius.circular(16),
  config: WrapBottomSheetConfig(
    builder: (context, controller) {
      return buildBottomSheetContent(context, 'Wrap',
          'This type of bottom sheet wraps its content');
    },
  ),
);
```

# Back Blur Image
Blur any image and put it behind any widget to enhance your UI/UX.

<img src="https://github.com/mohyghb/Moye/assets/37986616/9c51be48-adbe-420d-9bfd-61f031c3b9a7"/>

```dart
Container(
  width: 100,
  height: 100,
).withBackBlurImage(
    imageProvider: NetworkImage(
        'https://i.natgeofe.com/n/b103fff5-6a84-4d19-b65e-5856998816c3/PIA19952.jpg?w=1440&h=1440')),
)
```
