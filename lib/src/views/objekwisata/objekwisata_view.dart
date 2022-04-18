import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../index.dart';

class ObjekwisataView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextStyle style = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto');

  ObjekwisataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(
          title: 'Pilih Objek Wisata...',
          scaffoldKey: scaffoldKey,
          pageContext: context),
      drawer: customDrawer(pageContext: context),
      body: BlocBuilder<AppDataCubit, AppDataListState>(
        builder: (contextBloc, state) {
          return ListView.builder(
            itemCount: state.appdata.length,
            itemBuilder: (contextBloc, index) {
              final tempat = [];
              for (var objec in state.appdata[index].objek) {
                tempat.addAll(objec['tempat']);
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ObjekwisataNameContainer(
                        tempat: tempat,
                        name: state.appdata[index].name,
                      ),
                      _ObjekwisataSeeMore(index: index)
                    ],
                  ),
                  _ObjekwisataTempatList(
                    tempat: tempat,
                    index: index,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _ObjekwisataTempatList extends StatelessWidget {
  final int index;
  const _ObjekwisataTempatList({
    Key? key,
    required this.tempat,
    required this.index,
  }) : super(key: key);

  final List tempat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tempat.length,
        itemBuilder: (lokasiContext, lokasiIndex) {
          return Container(
            margin: const EdgeInsets.only(right: 5, left: 10),
            child: LokasiBox(
              onTap: () {
                Navigator.pushNamed(context, '/lokasi', arguments: tempat[lokasiIndex]);
              },
              data: tempat[lokasiIndex],
            ),
          );
        },
      ),
    );
  }
}

class _ObjekwisataSeeMore extends StatelessWidget {
  final int index;
  const _ObjekwisataSeeMore({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/tempat', arguments: index);
      },
      child: const Text(
        "Lihat tempat",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _ObjekwisataNameContainer extends StatelessWidget {
  final String name;
  const _ObjekwisataNameContainer({
    Key? key,
    required this.tempat,
    required this.name,
  }) : super(key: key);

  final List tempat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 13, right: 20),
      child: Text(
        "$name (${tempat.length})",
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
