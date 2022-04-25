import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_e_commerce_app/cubit/page_cubit.dart';
import 'package:latihan_e_commerce_app/presentation/views/main_page.dart';
import 'package:latihan_e_commerce_app/utils/theme.dart';

import 'presentation/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: greenTwoColor.withOpacity(0.5),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MainPage.routeName,
        routes: {
          MainPage.routeName: (context) => const MainPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
