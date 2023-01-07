import 'package:financecontrol/src/app_routes.dart';
import 'package:financecontrol/src/modules/splash/bloc/events/splash_event.dart';
import 'package:financecontrol/src/modules/splash/bloc/splash_bloc.dart';
import 'package:financecontrol/src/modules/splash/bloc/states/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final bloc = Modular.get<SplashBloc>();
    bloc.stream.listen((state) {
      if (state is SplashGetDataSuccessState) {
        Modular.to.navigate(AppRoutes.dashboard(),
            arguments: [state.inputs, state.outputs]);
      }
      if (state is SplashGetDataFailState) {
        Modular.to.navigate(AppRoutes.dashboard(),
            arguments: [state.inputs, state.outputs]);
      }
    });
    bloc.add(InitializeApp());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<SplashBloc>();
    return Scaffold(
        body: BlocBuilder<SplashBloc, SplashStates>(
            bloc: bloc,
            builder: (context, state) {
              if (state is SplashInitialState) {
                return const Center(child: Text('icone app'));
              } else {
                return const SizedBox();
              }
            }));
  }
}
