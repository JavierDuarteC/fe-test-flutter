import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/presentation/bloc/universities_bloc.dart';
import 'package:test/presentation/pages/universities_page.dart';
import 'package:test/presentation/pages/university_detail.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<UniversitiesBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: UniversitiesPage.routeName,
        routes: {
          UniversitiesPage.routeName: (context) => const UniversitiesPage(),
          UniversityDetail.routeName: (context) => const UniversityDetail(),
        },
      ),
    );
  }
}
