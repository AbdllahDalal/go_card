import 'package:dream_store_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routers/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => SignUpNamePage(),
      //   ),
      // );
      Get.offNamed(RoutesClass.getOnBordingPageRoute());
    });
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isOrientation =
    //     MediaQuery.of(context).orientation == Orientation.landscape;
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width:
              size.width < size.height ? size.width - 100 : size.height - 100,
          child: Image.asset(
            Constants.splashPageImage,
            width:
                size.width < size.height ? size.width - 100 : size.height - 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
