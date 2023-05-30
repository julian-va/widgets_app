import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String titel;
  final String caption;
  final String imageUrl;

  SlideInfo(this.titel, this.caption, this.imageUrl);
}

final slidea = <SlideInfo>[
  SlideInfo(
      'Prueba tutorial slide1', 'Prueba caption 1', 'assets/images/1.png'),
  SlideInfo(
      'Prueba tutorial slide2', 'Prueba caption 2', 'assets/images/2.png'),
  SlideInfo(
      'Prueba tutorial slide3', 'Prueba caption 3', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool endReched = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;

      if (!endReched && page >= (slidea.length - 1.5)) {
        setState(() {
          endReched = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slidea
                .map((slideDta) => _Silde(
                    titel: slideDta.titel,
                    caption: slideDta.caption,
                    imageUrl: slideDta.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                // ignore: prefer_const_constructors
                child: Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReched
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FilledButton(
                    child: const Text('Comenzar'),
                    onPressed: () => context.pop(),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Silde extends StatelessWidget {
  final String titel;
  final String caption;
  final String imageUrl;
  const _Silde(
      {required this.titel, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStile = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(titel, style: titleStile),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ]),
    );
  }
}
