import 'package:flutter/material.dart';
import 'package:gotrip/bottom_nav.dart';
import 'package:gotrip/core/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANNON_KEY,
    debug: true,
  );
  initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, _, __) {
      return MaterialApp(
        title: 'GoTrip',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: const BottomNav(),
      );
    });
  }
}
