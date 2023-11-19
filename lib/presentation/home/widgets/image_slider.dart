// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/colors.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({
    Key? key,
    required this.items,
     this.isAsset = true,
  }) : super(key: key);
  final List<String> items;
  final bool isAsset;
  final ValueNotifier<int> _current = ValueNotifier<int>(0);
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _current,
      builder: (context, value, _) {
        return Column(
          children: [
            CarouselSlider(
              items: isAsset ?   items
                  .map((e) => Image.asset(
                        e,
                        height: 206.0,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ))
                  .toList() :  items
                  .map((e) => Image.network(
                        e,
                        height: 206.0,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 343 / 206,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _current.value = index;
                },
              ),
            ),
            const SpaceHeight(22.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? ColorName.grey
                                : ColorName.primary)
                            .withOpacity(
                                _current.value == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
