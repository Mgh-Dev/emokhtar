import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentScreen extends StatefulWidget {
  final String calendlyUrl;

  const AppointmentScreen({super.key, required this.calendlyUrl});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  bool _isLaunching = false;
  String? _errorMessage;

  Future<void> _launchBooking() async {
    setState(() {
      _isLaunching = true;
      _errorMessage = null;
    });

    try {
      final uri = Uri.parse(widget.calendlyUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.inAppWebView, // Opens in-app browser on iOS/Android
          webViewConfiguration: const WebViewConfiguration(
            headers: <String, String>{'Content-Type': 'text/html'},
          ),
        );
      } else {
        setState(() => _errorMessage = 'Cannot open booking link');
      }
    } catch (e) {
      setState(() => _errorMessage = 'Error opening booking: ${e.toString()}');
    } finally {
      setState(() => _isLaunching = false);
    }
  }

  @override
  void initState() {
    super.initState();
    // Automatically launch when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) => _launchBooking());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFFE8F5E9),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'حجز موعد',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLaunching)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF075E54)),
              ),
            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF075E54)),
                child: const Text('Retry', style: TextStyle(color: Colors.white)),
              )
            ]
          ],
        ),
      ),
    );
  }
}