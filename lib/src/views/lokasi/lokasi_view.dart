import 'package:flutter/material.dart';
import '../../index.dart';

class LokasiView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextStyle style = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto');

  LokasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var lokasiData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerBarHeight = MediaQuery.of(context).padding.bottom;

    var starRate = double.parse(lokasiData['review']).floor();

    List<bool> stars = [];

    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: customDrawer(pageContext: context),
      body: Stack(
        children: [
          _LokasiMainImage(lokasiData: lokasiData),
          ListView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              _LokasiGeneralContainer(lokasiData: lokasiData, stars: stars, footerBarHeight: footerBarHeight)
            ],
          ),
          _LokasiBackButton(statusBarHeight: statusBarHeight),
        ],
      ),
    );
  }
}

class _LokasiGeneralContainer extends StatelessWidget {
  const _LokasiGeneralContainer({
    Key? key,
    required this.lokasiData,
    required this.stars,
    required this.footerBarHeight,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;
  final List<bool> stars;
  final double footerBarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _LokasiName(lokasiData: lokasiData),
                    _LokasiStars(stars: stars, lokasiData: lokasiData)
                  ],
                ),
              )
            ],
          ),
          _LokasiDescription(lokasiData: lokasiData),
          const Divider(
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Foto Tempat Wisata'),
          ),
          _LokasiPlacesGrid(
              footerBarHeight: footerBarHeight, lokasiData: lokasiData),
          const Divider(
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Alamat'),
          ),
          _LokasiAddress(lokasiData: lokasiData),
          const Divider(
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Jam Operasional'),
          ),
          _LokasiJam(lokasiData: lokasiData),
          const Divider(
            thickness: 1,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text('Tiket Masuk'),
          ),
          _LokasiTiket(lokasiData: lokasiData),
          Container(
            height: MediaQuery.of(context).size.height, // add this line
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }
}

class _LokasiBackButton extends StatelessWidget {
  const _LokasiBackButton({
    Key? key,
    required this.statusBarHeight,
  }) : super(key: key);

  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: statusBarHeight + 10, left: 10),
      child: IconButton(
        onPressed: () {
          return Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _LokasiMainImage extends StatelessWidget {
  const _LokasiMainImage({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 250,
      child: Image.network(
        lokasiData['places'][0]['img'],
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LokasiName extends StatelessWidget {
  const _LokasiName({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Text(lokasiData['name'],
        style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'));
  }
}

class _LokasiDescription extends StatelessWidget {
  const _LokasiDescription({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
      child: Text(
        lokasiData['description'],
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

class _LokasiAddress extends StatelessWidget {
  const _LokasiAddress({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
      child: Text(
        lokasiData['address'],
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

class _LokasiJam extends StatelessWidget {
  const _LokasiJam({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
      child: Text(
        lokasiData['jam_operasional'],
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

class _LokasiTiket extends StatelessWidget {
  const _LokasiTiket({
    Key? key,
    required this.lokasiData,
  }) : super(key: key);

  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
      child: Text(
        lokasiData['tiket_masuk'],
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

class _LokasiPlacesGrid extends StatelessWidget {
  const _LokasiPlacesGrid({
    Key? key,
    required this.footerBarHeight,
    required this.lokasiData,
  }) : super(key: key);

  final double footerBarHeight;
  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.only(bottom: footerBarHeight),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(lokasiData['places'].length, (index) {
          return Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      lokasiData['places'][index]['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                child: Text(lokasiData['places'][index]['name']),
              ),
            ],
          );
        }));
  }
}

class _LokasiStars extends StatelessWidget {
  const _LokasiStars({
    Key? key,
    required this.stars,
    required this.lokasiData,
  }) : super(key: key);

  final List<bool> stars;
  final Map<String, dynamic> lokasiData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: stars[0] ? Colors.blue : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: stars[1] ? Colors.blue : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: stars[2] ? Colors.blue : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: stars[3] ? Colors.blue : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: 16,
          color: stars[4] ? Colors.blue : Colors.grey,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(lokasiData['review'], style: const TextStyle(fontSize: 11)),
        )
      ],
    );
  }
}
