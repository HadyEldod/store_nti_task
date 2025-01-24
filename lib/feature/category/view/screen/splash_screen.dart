import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../registeration/screen/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 7),
          () => {
        if (mounted)
          {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            )
          }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.ntiegypt.sci.eg/moodle/pluginfile.php/1/core_admin/logocompact/300x300/1725271317/NTI%20Logo.png',
            height: 200,
          ),
          const SpinKitDoubleBounce(
            color: Colors.black,
            size: 200.0,
            duration: Duration(seconds: 3),
          )
        ],
      ),
    );
  }
}