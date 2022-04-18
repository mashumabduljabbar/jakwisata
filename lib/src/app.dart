import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jakwisata/src/data/repositories/appdata.dart';
import 'package:jakwisata/src/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AppDataCubit(appDataRepository: AppDataRepository()),
        )
      ],
      child: const Routes(),
    );
  }
}
