import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../index.dart';

class TempatView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextStyle style = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto');

  TempatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final objekwisataIndex = ModalRoute.of(context)!.settings.arguments as int;
    return BlocBuilder<AppDataCubit, AppDataListState>(
        builder: (contextPage, state) {
      final tempat = [];
      for (var objec in state.appdata[objekwisataIndex].objek) {
        tempat.addAll(objec['tempat']);
      }
      return Scaffold(
          key: scaffoldKey,
          appBar: customAppBar(
              showBack: true,
              title: "${state.appdata[objekwisataIndex].name} (${tempat.length})",
              scaffoldKey: scaffoldKey,
              pageContext: context),
          drawer: customDrawer(pageContext: context),
          body: _TempatGrid(tempat: tempat));
    });
  }
}

class _TempatGrid extends StatelessWidget {
  const _TempatGrid({
    Key? key,
    required this.tempat,
  }) : super(key: key);

  final List tempat;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        tempat.length,
        (index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: LokasiBox(
              onTap: () {
                Navigator.pushNamed(context, '/lokasi', arguments: tempat[index]);
              },
              data: tempat[index],
            ),
          );
        },
      ),
    );
  }
}
