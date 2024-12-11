import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_responsive/config/app_config_get_it.dart';
import 'package:form_responsive/core/constants/app_colors.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:form_responsive/presentation/pages/home_page.dart';

import 'package:get_it/get_it.dart';

void main() {
  configureGetItApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Responsive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0, // Similar a la barra de Cupertino
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) => ProfileBloc(
          getProfileUseCase: GetIt.instance.get(),
          saveProfileUseCase: GetIt.instance.get(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
