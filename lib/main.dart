import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_lilac/application/requestOTP/bloc/requestOtp_bloc.dart';
import 'package:machine_test_lilac/injectable.dart';
import 'package:machine_test_lilac/presentation/splashscreen.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OtpBloc(baseUrl: 'https://test.myfliqapp.com/api/v1'),
        ),
        BlocProvider(
          create: (context) => OtpBloc(baseUrl: 'https://test.myfliqapp.com/api/v1'),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
    

  }
}
