import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleSignInScreen extends StatefulWidget {
  final String url;

  const GoogleSignInScreen({super.key, required this.url});

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  void initState() {
    super.initState();
    _launchGoogleSignIn();
  }

  void _launchGoogleSignIn() async {
    final Uri googleSignInUrl = Uri.parse(widget.url);

    if (await canLaunchUrl(googleSignInUrl)) {
      await launchUrl(
        googleSignInUrl,
        mode: LaunchMode
            .externalApplication, // Ensures it opens in the external browser
      );
    } else {
      throw 'Could not launch $googleSignInUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign-In"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchGoogleSignIn,
          child: const Text("Open Google Sign-In"),
        ),
      ),
    );
  }
}
