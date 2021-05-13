import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomCarousel extends HookWidget {
  CustomCarousel({
    Key? key,
    required this.items,
  }) : super(key: key);

  final CarouselController _controller = CarouselController();

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final currentIndexState = useState(0);

    return Column(
      children: [
        SizedBox(
          height: 550,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CarouselSlider(
                carouselController: _controller,
                items: items,
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, __) {
                      currentIndexState.value = index;
                    }),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_before_outlined),
                    onPressed: _controller.previousPage,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_next_outlined),
                    onPressed: _controller.nextPage,
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 3,
          children: items.map(
            (e) {
              final index = items.indexOf(e);

              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(index);
                    currentIndexState.value = index;
                  },
                  child: Container(
                    width: 10,
                    height: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndexState.value == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
