library creditcardslider;

import 'dart:math';

import 'package:flutter/material.dart';

import 'credit_card_widget.dart';

class CreditCardSlider extends StatelessWidget {
  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  final List<CreditCard> creditCards;
  final double percentOfUpperCard;

  CreditCardSlider(
    this.creditCards, {
    this.percentOfUpperCard = 0.35,
  }) {
    assert(percentOfUpperCard >= 0);
    assert(percentOfUpperCard <= pi / 2);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: creditCards.length,
      itemBuilder: (context, index) => _builder(index),
    );
  }

  _builder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;

          if (value >= 0) {
            double _lowerLimit = percentOfUpperCard;
            double _upperLimit = pi / 2;

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else {
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = -1;
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
      child: creditCards[index],
    );
  }
}
