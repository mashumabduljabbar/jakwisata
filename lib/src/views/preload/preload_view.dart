import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../index.dart';

class PreloadView extends StatelessWidget {
  const PreloadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const PreloadView();
    {
      context
          .read<AppDataCubit>()
          .fetchData()
          .then((value) => Navigator.pushReplacementNamed(context, '/beranda'));
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocBuilder<AppDataCubit, AppDataListState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _PreloadLogo(),
                  state.status == AppDataStatus.loading
                      ? const _PreloadLoadingData()
                      : state.status == AppDataStatus.failure
                          ? const _PreloadFailedLoadData()
                          : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PreloadLoadingData extends StatelessWidget {
  const _PreloadLoadingData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text(
            'Loading...',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        )
      ],
    );
  }
}

class _PreloadLogo extends StatelessWidget {
  const _PreloadLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('lib/src/assets/Jakarta.svg.png',
        width: 300, height: 300);
  }
}

class _PreloadFailedLoadData extends StatelessWidget {
  const _PreloadFailedLoadData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => context.read<AppDataCubit>().fetchData(),
        child: const Text('Load again'),
      ),
    );
  }
}
