import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:ezy_course/data/data_source/remote/login/login_datasource.dart';
import 'package:ezy_course/data/repository/login/login_repository_impl.dart';
import 'package:ezy_course/domain/use_cases/login/login_use_case.dart';
import 'package:ezy_course/presentation/screens/login/login_screen.dart';
import 'package:ezy_course/presentation/screens/login/state/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => LoginBloc(
              loginUseCase: LoginUseCase(
                repository: LoginRepositoryImpl(
                  dataSource: LoginDataSourceImpl(
                    client: http.Client(),
                    baseUrl: ApiEndpoints.baseUrl,
                  ),
                ),
              ),
            ),
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Figtree",
                useMaterial3: true,
              ),
              home: const LoginScreen(),
            ),
          );
        });
  }
}
