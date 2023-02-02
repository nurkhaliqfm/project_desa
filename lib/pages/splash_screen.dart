import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_desa/bloc/splash_screen/splash_screen_bloc.dart';

import '../main_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(136, 188, 69, 1),
                Color.fromRGBO(93, 179, 26, 1),
                Color.fromRGBO(23, 133, 21, 1)
              ],
            ),
          ),
          child: BlocProvider(
            create: (context) =>
                SplashScreenBloc()..add(NavigateToHomeScreenEvent()),
            child: BlocListener<SplashScreenBloc, SplashScreenState>(
              listener: (context, state) {
                if (state is SplashScreenLoaded) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MainNavigation(),
                    ),
                  );
                }
              },
              child: _buildSplashWidget(),
            ),
          )),
    );
  }

  Widget _buildSplashWidget() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(136, 188, 69, 1),
              Color.fromRGBO(93, 179, 26, 1),
              Color.fromRGBO(23, 133, 21, 1)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/codebreak.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                const Text(
                  "Kampung Digital",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
