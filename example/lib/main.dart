import 'package:example/with_package/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:moye/extensions/moye_extensions.dart';
import 'package:moye/moye.dart';
import 'package:moye/widgets/linear_gradient_progress_bar.dart';
import 'package:moye/widgets/overlay_glow.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearGradientProgressBar(
          value: 0.8,
          borderRadius: BorderRadius.circular(100),
          enableGlow: true,
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary,
              context.colorScheme.primary.withOpacity(0.7),
              context.colorScheme.onPrimaryContainer.withOpacity(0.5),
              context.colorScheme.secondaryContainer
            ],
          ),
        ).withPadding(s16HorizontalPadding),
      ),
    );
  }
}
