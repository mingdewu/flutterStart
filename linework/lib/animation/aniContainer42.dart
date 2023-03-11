import 'package:flutter/material.dart';


class Ani42 extends StatefulWidget {
  Ani42({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  _Ani42State createState() => _Ani42State();
}

class _Ani42State extends State<Ani42> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = _controller.drive(
      Tween<double>(begin: 0, end: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: _animation.value,
              width: _animation.value,
              // 引数からFlutterLogoのインスタンスが渡される
              child: child,
            );
          },
          child: const FlutterLogo(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.forward(),
      ),
    );
  }
}