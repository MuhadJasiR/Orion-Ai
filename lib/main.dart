import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orion_ai/pages/chat_page.dart';
import 'package:orion_ai/pages/home_page.dart';
import 'package:orion_ai/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.submitButton),
            scaffoldBackgroundColor: AppColors.background,
            textTheme:
                GoogleFonts.interTextTheme(ThemeData.dark().textTheme.copyWith(
                        bodyMedium: const TextStyle(
                      fontSize: 15,
                      color: AppColors.whiteColor,
                    )))),
        home: const HomePage());
  }
}
