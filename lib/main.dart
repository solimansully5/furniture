import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Admin/AndroidStudioProjects/Furniture-App-UI-2-Flutter/lib/utilities/constants.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/auth/screen0.dart';
import 'screens/auth/screen1.dart';
import 'screens/auth/sceen2.dart';
import 'router.dart';
import 'utilities/routing_constants.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: screen0Route,
      onGenerateRoute: Router.generateRoute,

       debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Here we set DM Sans as our default fonts
        // Now we also apply out text color to all flutter textTheme
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        // Almost all of our app bar have this style
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
