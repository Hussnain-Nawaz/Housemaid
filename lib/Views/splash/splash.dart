import 'package:flutter/material.dart';
import 'package:house_maid_project/Controllers/splashController.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplashScreenController _controller = SplashScreenController();

  @override
  void initState() {
    super.initState();
    _controller.startSplashSequence(() {
      setState(() {
        _controller.changeSplashAppearance(() {
          _controller.handleUserNavigation(context);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: _controller.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _controller.logoAsset,
                width: 150,
              ),
              const SizedBox(height: 20),
              // Text(
              //   'HouseMaide',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: _controller.textColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
