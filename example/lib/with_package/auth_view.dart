import 'package:example/demo_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moye/extensions/moye_extensions.dart';

class AuthView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthViewState();
  }

}

class AuthViewState extends State<AuthView> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.network(DemoUtils.IMAGE_URLS[0]).fitCover),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.heightBox,
              Text('Think\nDifferent', style: textTheme.displayMedium.bold.withColor(Colors.white70)),
              8.heightBox,
              Text('Some sort of description goes here. '*5, style: TextStyle(color: Colors.white70)),
              1.expanded,
              ElevatedButton(onPressed: (){}, child: Text('Create new Account').withPadding(16.allInset)).withRoundCorners().withPadding(8.horizontalInset),
              2.heightBox,
              TextButton(onPressed: (){}, child: Text('Already have an account?')),
            ],
          ).withPadding(16.allInset),
        )
      ],
    );
  }

}