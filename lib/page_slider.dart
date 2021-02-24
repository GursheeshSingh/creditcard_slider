import 'dart:math';

import 'package:flutter/cupertino.dart';

class PageSlider extends StatelessWidget {
  PageController? _pageController;

  final List<Widget> cards;
  final double percentOfUpperCard;
  final int initialPage;
  final bool repeatCards;

  PageSlider(
    this.cards, {
    this.repeatCards = false,
    this.percentOfUpperCard = 0.35,
    this.initialPage = 0,
  }) {
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: initialPage,
    );
    assert(initialPage >= 0);
    assert(initialPage < cards.length);
    assert(percentOfUpperCard >= 0);
    assert(percentOfUpperCard <= pi / 2);
  }

  @override
  Widget build(BuildContext context) {
    if (repeatCards) {
      return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => _builder(index, cards.length),
      );
    }
    return PageView.builder(
      controller: _pageController,
      itemCount: cards.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => _builder(index, cards.length),
    );
  }

  _builder(int index, int length) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (context, child) {
        double value = 1.0;

        int mIndex = index % length;
        int mInitialPage = initialPage % length;

        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;

          if (value >= 0) {
            double _lowerLimit = percentOfUpperCard;
            double _upperLimit = pi / 2;

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else {
          if (mIndex == mInitialPage) {
            //This will show that card fully
            value = 0;
          } else if (mInitialPage == 0 || mIndex == mInitialPage - 1) {
            //This will show the upper card with the percentage specified
            value = -(pi / 2 - percentOfUpperCard);
          } else if (mIndex == mInitialPage + 1) {
            //This will be fixed
            value = -1;
          } else {
            //This will hide the other cards
            value = pi / 2;
          }
        }

        return Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(value),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: cards[index % length],
    );
  }
}
