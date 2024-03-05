import 'package:fic7_multistore_users_muhamadfikri/bloc/register/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/logout/logout_bloc.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'pages/auth/auth_page.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'utils/light_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: light,
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!) {
              return const DashboardPage();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
