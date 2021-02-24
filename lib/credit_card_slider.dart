library credit_card_slider;

import 'dart:math';

import 'package:flutter/material.dart';

import 'credit_card_widget.dart';

typedef void OnCardClicked(int index);

enum RepeatCards { down, bothDirection, none }

///[initialCard] is 0 based index
///[repeatCards] can have 3 values - [RepeatCards.none], [RepeatCards.down] or [RepeatCards.bothDirection]
///Use [RepeatCards.bothDirection] for repeating cards on both sides
///Use [RepeatCards.down] for repeating cards only down
class CreditCardSlider extends StatelessWidget {
  PageController? _pageController;

  final List<CreditCard> creditCards;
  final double percentOfUpperCard;
  final OnCardClicked? onCardClicked;
  final RepeatCards repeatCards;
  int initialCard;

  CreditCardSlider(
    this.creditCards, {
    this.onCardClicked,
    this.repeatCards = RepeatCards.none,
    this.initialCard = 0,
    this.percentOfUpperCard = 0.35,
  }) {
    assert(initialCard >= 0);
    assert(initialCard < creditCards.length);
    assert(percentOfUpperCard >= 0);
    assert(percentOfUpperCard <= pi / 2);

    if (repeatCards == RepeatCards.bothDirection) {
      initialCard = (creditCards.length * 1000000) + initialCard;
    }
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: initialCard,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (repeatCards == RepeatCards.down ||
        repeatCards == RepeatCards.bothDirection) {
      return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => _builder(index, creditCards.length),
      );
    }
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: creditCards.length,
      itemBuilder: (context, index) => _builder(index, creditCards.length),
    );
  }

  _builder(int index, int length) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (context, child) {
        double value = 1.0;

        int mIndex = index % length;
        int mInitialPage = initialCard % length;

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
      child: GestureDetector(
        onTap: () {
          onCardClicked?.call(index % length);
        },
        child: creditCards[index % length],
      ),
    );
  }
}
