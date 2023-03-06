import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/dio_settings.dart/dio_settings.dart';
import 'package:rick_and_morty/home_page/ui/screens/home_page_screen.dart';

import 'home_page/cubit/get_character_cubit.dart';
import 'home_page/repositories/get_character_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetCharacterRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => GetCharacterCubit(
          repo: RepositoryProvider.of<GetCharacterRepo>(context),
        ),
        child: const MaterialApp(
          home: HomePageScreen(),
        ),
      ),
    );
  }
}
