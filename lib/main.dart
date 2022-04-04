import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_application/notifiers/internet_notifiers.dart';
import 'package:quiz_application/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => INTERNET())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    INTERNET net = Provider.of<INTERNET>(context);
    net.checkInternetConnectivity();
    // print("Internet Connection : " + net.hasInternet.toString());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //  net.hasInternet ?
            const SplashScreen()
        // : const InternetConnection()
        );
  }
}
