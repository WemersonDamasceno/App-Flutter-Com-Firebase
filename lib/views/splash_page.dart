import 'dart:async';
import 'package:flutter/material.dart';
import 'package:novo_projeto/helpers/wrapper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<SplashPage> with SingleTickerProviderStateMixin {
  var _visible = true;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Wrapper()));
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 300,
              child: Image.asset("assets/images/logo.png"),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
