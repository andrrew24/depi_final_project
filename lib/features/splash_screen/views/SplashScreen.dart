import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final int durationInSeconds;

  const SplashScreen({super.key, required this.durationInSeconds});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Add any initialization logic here
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: widget.durationInSeconds), () {});
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Movies App",
              style: TextStyle(fontSize: 40),),
            SizedBox(
                width: 150,
                height: 150,
                child: Lottie.asset('assets/lottie/lottie-movie-splash.json'),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

