import 'package:flutter/material.dart';
import 'package:moye/moye.dart';

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
  String image =
      'http://www.nasa.gov/sites/default/files/thumbnails/image/web_first_images_release.png';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    image,
                    height: 150,
                  ),
                  s16WidthBox,
                  Text('Space Image')
                      .withPadding(s16Padding)
                      .withBackBlurImage(
                          imageProvider: NetworkImage(image),
                          imageColorBlendMode: BlendMode.darken)
                      .expanded
                ],
              ),
            ).withHeight(150)
            // LinearGradientProgressBar(
            //   value: 0.8,
            //   borderRadius: BorderRadius.circular(100),
            //   enableGlow: true,
            //   gradient: LinearGradient(
            //     colors: [
            //       context.colorScheme.primary,
            //       context.colorScheme.primary.withOpacity(0.7),
            //       context.colorScheme.onPrimaryContainer.withOpacity(0.5),
            //       context.colorScheme.secondaryContainer
            //     ],
            //   ),
            // ).withPadding(s16HorizontalPadding),
            // FadeContainer.bottom(
            //   context: context,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) => ListTile(
            //       title: Text('item $index'),
            //     ),
            //   ),
            // ).expanded,
            // s32HeightBox,
            // ElevatedButton(
            //   onPressed: () {
            //     BottomSheetUtils.showBottomSheet(
            //       context: context,
            //       borderRadius: BorderRadius.circular(14),
            //       child: Column(
            //         children: [
            //           BottomSheetHandle(),
            //           Placeholder().withPadding(s24Padding),
            //         ],
            //       ),
            //     );
            //   },
            //   child: Text('Bottom sheet test'),
            // ).withGlowContainer()
          ],
        ),
      ),
    );
  }
}
