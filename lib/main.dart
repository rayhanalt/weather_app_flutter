import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slice_flutter/assets/colors.dart';
import 'package:slice_flutter/page/weather_list.dart';
import 'package:slice_flutter/routes/routes.dart';
import 'package:slice_flutter/screen/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorAssets.solid1),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          sliderTheme: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
        ),
        routes: {
          Routes.home: (context) => const HomeScreen(),
          Routes.weatherList: (context) => const WeatherPage(),
        });
  }
}
