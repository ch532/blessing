import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:appodeal_flutter/appodeal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Appodeal.initialize(
    appKey: '923bc30ebaca5186de21bbebb9612173a8759ba61bbb4ed0',
    adTypes: [
      AppodealAdType.Banner,
      AppodealAdType.Interstitial,
      AppodealAdType.RewardedVideo,
    ],
    hasConsent: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Gold',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png', width: 200),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://connectgold.sbs',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: AppodealBanner(
          adSize: AppodealBannerSize.BANNER,
        ),
      ),
    );
  }
}