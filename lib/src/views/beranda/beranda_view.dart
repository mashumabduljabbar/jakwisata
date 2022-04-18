import 'package:flutter/material.dart';
import '../../index.dart';

class BerandaView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextStyle style = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.normal, fontFamily: 'Jakarta');

  BerandaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(
          title: 'Beranda', scaffoldKey: scaffoldKey, pageContext: context),
      drawer: customDrawer(pageContext: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BerandaTitle(style: style),
            const _BerandaLogo(),
            _BerandaSubtitle(style: style),
            _BerandaButton(style: style)
          ],
        ),
      ),
    );
  }
}

class _BerandaTitle extends StatelessWidget {
  const _BerandaTitle({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Text(
        'Selamat Datang di Jakarta',
        style: style,
      ),
    );
  }
}

class _BerandaSubtitle extends StatelessWidget {
  const _BerandaSubtitle({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        'Maju Kotanya, Bahagia Warganya!',
        style: style,
      ),
    );
  }
}

class _BerandaButton extends StatelessWidget {
  const _BerandaButton({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 45,
        ),
        label: Text('Cari Objek Wisata', style: TextStyle(fontSize: 21)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/objekwisata');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class _BerandaLogo extends StatelessWidget {
  const _BerandaLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.asset('lib/src/assets/Jakarta.svg.png',
          width: 300, height: 300),
    );
  }
}
