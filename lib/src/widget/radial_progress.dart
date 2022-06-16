import 'package:flutter/material.dart';
import 'dart:math';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryGirth;
  final double primaryGirth;

  const RadialProgress({
    Key? key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.black,
    this.secondaryGirth = 10,
    this.primaryGirth = 10,
  }) : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double lastPercentage;

  @override
  void initState() {
    lastPercentage = widget.percentage;

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animateGap = widget.percentage - lastPercentage;

    lastPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
                painter: _MyRadialPainter(
                    (widget.percentage - lastPercentage) +
                        (lastPercentage * controller.value),
                    widget.primaryColor,
                    widget.secondaryColor,
                    widget.secondaryGirth, 
                    widget.primaryGirth)
         )
        );
      },
    );
  }
}

class _MyRadialPainter extends CustomPainter {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryGirth;
  final double primaryGirth;

  _MyRadialPainter(
    this.percentage, 
    this.primaryColor, 
    this.secondaryColor,
    this.secondaryGirth,
    this.primaryGirth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = secondaryGirth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final arcPaint = new Paint()
      ..strokeWidth = primaryGirth
      ..strokeCap   = StrokeCap.round
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
