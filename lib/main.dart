import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'splash_screen.dart';

// ============================================================================
// CONFIGURATION
// ============================================================================
// To change the web app URL, modify the constant below:
// Using www subdomain as that's what the site redirects to
const String kWebAppUrl = "https://www.zuummusicpr.com";

void main() {
  runApp(const ZuumApp());
}

class ZuumApp extends StatelessWidget {
  const ZuumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuum Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Start with splash screen, then navigate to WebView
      home: const SplashScreen(),
    );
  }
}

class WebAppScreen extends StatefulWidget {
  const WebAppScreen({super.key});

  @override
  State<WebAppScreen> createState() => _WebAppScreenState();
}

class _WebAppScreenState extends State<WebAppScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Enable DOM storage for better web app compatibility
      ..enableZoom(true)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _hasError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _isLoading = false;
              _hasError = true;
              _errorMessage = error.description;
            });
          },
          // Allow navigation within the same domain
          onNavigationRequest: (NavigationRequest request) {
            // Allow all navigation to ensure web app works properly
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(kWebAppUrl));
  }

  void _retry() {
    setState(() {
      _hasError = false;
      _errorMessage = null;
    });
    _controller.reload();
  }

  Future<void> _handleRefresh() async {
    await _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Full-screen WebView - SafeArea ensures content isn't hidden behind system UI
      body: Stack(
        children: [
          // WebView
          if (!_hasError)
            RefreshIndicator(
              onRefresh: _handleRefresh,
              child: WebViewWidget(controller: _controller),
            ),

          // Loading indicator with white background
          if (_isLoading && !_hasError)
            Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),

            // Error state
            if (_hasError)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Unable to load page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _errorMessage ?? 'No internet connection',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _retry,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

