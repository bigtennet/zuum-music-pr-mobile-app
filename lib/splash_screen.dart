import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';

/// Splash screen that displays the Zuum Music logo
/// Shows for a minimum duration before transitioning to the WebView
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWebView();
  }

  void _navigateToWebView() {
    // Show splash for at least 2 seconds, then navigate to WebView
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const WebAppScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo - will show placeholder if logo.png is not found
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                // Fallback if logo is not found - shows app name with icon
                return Column(
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 120,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Zuum Music',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            // Loading indicator
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

