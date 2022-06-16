import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color inactiveColor;
  final Color activeColor;
  final double primaryBullet;
  final double secondayBullet;

  const Slideshow(
      {required this.slides,
      this.topDots = false,
      this.activeColor = Colors.pink,
      this.inactiveColor = Colors.grey,
      this.primaryBullet = 12.0,
      this.secondayBullet = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _SlideShowModel(),
        child: SafeArea(
          child: Center(child: Builder(builder: (BuildContext context) {
            Provider.of<_SlideShowModel>(context).activeColor = activeColor;
            Provider.of<_SlideShowModel>(context).inactiveColor = inactiveColor;
            Provider.of<_SlideShowModel>(context).primaryBullet = primaryBullet;
            Provider.of<_SlideShowModel>(context).secondaryBullet =
                secondayBullet;

            return _SlideShowStructure(topDots: topDots, slides: slides);
          })),
        ));
  }
}

class _SlideShowStructure extends StatelessWidget {
  const _SlideShowStructure({
    Key? key,
    required this.topDots,
    required this.slides,
  }) : super(key: key);

  final bool topDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (topDots) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!topDots) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSlides, (index) => _Dot(index))
          // const <Widget>[
          //   _Dot(index: 0),
          //   _Dot(index: 1),
          //   _Dot(index: 2),
          // ],
          ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideShowModel>(context);
    final size = (ssModel.currentPage == index)
        ? ssModel.primaryBullet
        : ssModel.secondaryBullet;

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 12,
        height: 12,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: (ssModel.currentPage >= index - 0.5 &&
                    ssModel.currentPage < index + 0.5)
                ? ssModel.activeColor
                : ssModel.inactiveColor,
            shape: BoxShape.circle));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(35),
      child: slide,
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _activeColor = Colors.blue;
  Color _inactiveColor = Colors.indigo;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => _currentPage;

  set currentPage(double newPage) {
    _currentPage = newPage;
    notifyListeners();
  }

  Color get activeColor => _activeColor;

  set activeColor(Color color) {
    _activeColor = color;
  }

  Color get inactiveColor => _inactiveColor;

  set inactiveColor(Color color) {
    _inactiveColor = color;
  }

  double get primaryBullet => _primaryBullet;

  set primaryBullet(double size) {
    _primaryBullet = size;
  }

  double get secondaryBullet => _secondaryBullet;

  set secondaryBullet(double size) {
    _secondaryBullet = size;
  }
}
