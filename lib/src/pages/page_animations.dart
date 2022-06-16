import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimPage extends StatelessWidget {
  const AnimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimSquare(),
      ),
    );
  }
}

class _AnimSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
  }
}

class _Rectangulo extends StatefulWidget {
  @override
  State<_Rectangulo> createState() => _RectanguloState();
}

class _RectanguloState extends State<_Rectangulo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;

  late Animation<double> opac;
  late Animation<double> opacOut;

  late Animation<double> moveRight;
  late Animation<double> expand;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    opac = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moveRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    expand = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      debugPrint('status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        controller.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? childRectangle) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
              opacity: opac.value - opacOut.value, 
              child: Transform.scale(
              scale: expand.value,  
              child: childRectangle)
          )),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
