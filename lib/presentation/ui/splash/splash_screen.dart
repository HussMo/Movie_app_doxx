

import 'package:cubit_movies/presentation/ui/splash/splash_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constant/string_keys.dart';
import '../../router/approutes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      bloc: SplashCubit(goHome: ()=>context.go(AppRoutes.home)),
      builder: (BuildContext context,SplashState state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset("assets/images/3.0x/img.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    StringsKeys.movies.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
