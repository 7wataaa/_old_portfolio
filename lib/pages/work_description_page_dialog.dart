import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/custom_carousel.dart';
import 'package:portfolio/widgets/responsive_grid.dart';

class WorkDescriptionPageDialog extends HookWidget {
  const WorkDescriptionPageDialog({
    Key? key,
    required this.images,
    required this.descriptions,
    required this.title,
  }) : super(key: key);

  final List<Widget> images;

  final String title;

  final List<SelectableText> descriptions;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mobilepadding = size.width <= 480 ? 15.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.quicksand(),
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ResponsiveGrid(
                width: size.width,
                child: ColoredBox(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        size.width <= 480
                            ? MobileCustomCarousel(items: images)
                            : CustomCarousel(
                                items: images,
                              ),
                        Container(
                          width: 500,
                          padding: EdgeInsets.only(
                              left: mobilepadding, right: mobilepadding),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  '説明',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              ...descriptions,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
