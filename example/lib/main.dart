import 'package:example/bottom_sheet_view_example.dart';
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
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true, colorSchemeSeed: Colors.blue.shade900),
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true, colorSchemeSeed: Colors.blue.shade900),
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
      appBar: AppBar(
        actions: [
          ProgressButton(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
            child: const Text('Done'),
            icon: Icon(Icons.done),
          ).withPadding(s16HorizontalPadding)
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ),
            s32HeightBox,
            ProgressButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: const Text('Send Message'),
              icon: Icon(Icons.send),
            ),
            s16HeightBox,
            ElevatedButton(
              onPressed: () {
                BottomSheetUtils.showBottomSheet(
                  context: context,
                  config: WrapBottomSheetConfig(
                    builder: (context, controller) {
                      return BottomSheetViewExample();
                    },
                  ),
                );
              },
              child: const Text('Show Bottom Sheet'),
            )
          ],
        ).withPadding(s16Padding),
      ),
    );
  }
}
