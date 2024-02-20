import 'package:example/showcase_widget.dart';
import 'package:flutter/material.dart';
import 'package:moye/moye.dart';
import 'package:moye/widgets/gradient_overlay.dart';

void main() {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then((value) {
  //   runApp(MyApp());
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Colors.blue.shade900),
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          colorSchemeSeed: Colors.blue.shade900),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeContainer.bottom(
          context: context,
          child: ListView(
            padding: s16Padding,
            children: [
              ShowcaseWidget(
                child: Column(
                  children: [
                    Text('Here are the capabilities of this package',
                        style: context.textTheme.titleMedium)
                  ],
                ),
              ),
              ShowcaseWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Gradient Overlay',
                        style: context.textTheme.headlineLarge.bold),
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
                ),
              ),
              ShowcaseWidget(
                title: 'Glow Container',
                description:
                    'Adds an outer glow to the given widget. This is a similar glow that changing the elevation of a widget provides you, however, you can customize the outer glow by [color], [blurRadius], and [spreadRadius]',
                child: empty,
              ).withGlowContainer(blurRadius: 10),
              ShowcaseWidget(
                title: 'Linear Gradient Progress Bar',
                description:
                    'a progress bar that can have gradient colors and box shadows with animation when value changes',
                child: LinearGradientProgressBar(
                  value: 0.3,
                  borderRadius: BorderRadius.circular(56),
                  gradient: LinearGradient(colors: [
                    context.colorScheme.primary,
                    context.colorScheme.tertiary,
                  ]),
                ),
              ),
              ShowcaseWidget(
                title: 'Progress Button',
                description:
                    'A button that shows circular progress bar or a custom widget when pressed until the future task is complete. Useful to make show a feedback to the user when they press a button and debounce any incoming press events while the task is in progress.',
                child: Column(
                  children: [
                    ProgressButton(
                      onPressed: () async {
                        await Future.delayed(const Duration(seconds: 1));
                      },
                      child: const Text('Progress button - inside loading'),
                      icon: Icon(Icons.send),
                    ),
                    s16HeightBox,
                    ProgressButton(
                      loadingType: ProgressButtonLoadingType.replace,
                      onPressed: () async {
                        await Future.delayed(const Duration(seconds: 1));
                      },
                      child: const Text('Progress button - replace loading'),
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
              ShowcaseWidget(
                title: 'Bottom Sheet Utils',
                description: 'Show default, wrap, and scrollable bottom sheets',
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BottomSheetUtils.showBottomSheet(
                          context: context,
                          borderRadius: BorderRadius.circular(16),
                          config: DefaultBottomSheetConfig(
                            builder: (context, controller) {
                              return buildBottomSheetContent(context, 'Default',
                                  'This bottom sheet has 50 percent of screen as its height with no modification');
                            },
                          ),
                        );
                      },
                      child: Text('Default'),
                    ),
                    ElevatedButton(
                      onPressed: () {
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
                      },
                      child: Text('Wrap'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BottomSheetUtils.showBottomSheet(
                          context: context,
                          borderRadius: BorderRadius.circular(16),
                          config: ScrollableBottomSheetConfig(
                            builder: (context, controller) {
                              return SingleChildScrollView(
                                controller: controller,
                                child: buildBottomSheetContent(
                                    context,
                                    'Scrollable',
                                    'This type of bottom sheet allows it to be draggable'),
                              );
                            },
                          ),
                        );
                      },
                      child: Text('Scrollable'),
                    ),
                  ],
                ),
              ),
              ShowcaseWidget(
                title: 'Back Blur Image',
                description:
                    'Shows the child on top of the blurred version of the image provider provided. Useful to make the background of a widget blurry.',
                child: Container(
                  width: 100,
                  height: 100,
                ).withBackBlurImage(
                    imageProvider: NetworkImage(
                        'https://i.natgeofe.com/n/b103fff5-6a84-4d19-b65e-5856998816c3/PIA19952.jpg?w=1440&h=1440')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea buildBottomSheetContent(
      BuildContext context, String bottomSheetType, String description) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BottomSheetHandle().alignCenter,
          s8HeightBox,
          Text('$bottomSheetType Bottom Sheet',
                  style: context.textTheme.headlineMedium.bold)
              .withPadding(s16HorizontalPadding),
          s4HeightBox,
          Text(description).withPadding(s16HorizontalPadding),
          s32HeightBox,
        ],
      ),
    );
  }
}
