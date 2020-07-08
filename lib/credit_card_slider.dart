library credit_card_slider;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'credit_card_widget.dart';

typedef void OnCardClicked(int index);
enum RepeatCards { DOWN, BOTH_SIDES, NONE }

class CreditCardSlider extends StatefulWidget {
  PageController _pageController;

  final List<CreditCard> creditCards;
  final double percentOfUpperCard;
  final OnCardClicked onCardClicked;
   int initialPage;
   final RepeatCards repeatCards;

  CreditCardSlider(
    this.creditCards, {
    this.onCardClicked,
    this.repeatCards =  RepeatCards.NONE,
    this.initialPage = 0,
    this.percentOfUpperCard = 0.35,
  }) {

    
 assert(initialPage >= 0);
    assert(initialPage < creditCards.length);
    assert(percentOfUpperCard >= 0);
    assert(percentOfUpperCard <= pi / 2);
     if (repeatCards == RepeatCards.BOTH_SIDES) {
      initialPage = (creditCards.length * 1000000) + initialPage;
    }
    _pageController = PageController(
      viewportFraction: 0.3,
      initialPage: initialPage,
    );
    
  }

  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();
}

class _CreditCardSliderState extends State<CreditCardSlider> with AfterLayoutMixin<CreditCardSlider> {
  @override
  void afterFirstLayout(BuildContext context) {
    animateTo();
  }

  void animateTo(){
    widget._pageController.jumpToPage((widget.initialPage/2).floor());

  }

  @override
  Widget build(BuildContext context) {
    if (widget.repeatCards == RepeatCards.DOWN ||
        widget.repeatCards == RepeatCards.BOTH_SIDES) {
      return PageView.builder(
        controller: widget._pageController,
        scrollDirection: Axis.vertical,
         
        
        //  loop:true, 
        itemBuilder: (context, index) => _builder(index, widget.creditCards.length),
      );
    }
    return PageView.builder(
      controller: widget._pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.creditCards.length,
      itemBuilder: (context, index) => _builder(index, widget.creditCards.length),
    );
  }

 _builder(int index, int length) {
    return AnimatedBuilder(
      animation: widget._pageController,
      builder: (context, child) {
        double value = 1.0;

        if (widget._pageController.position.haveDimensions) {
          value = widget._pageController.page - index;

          if (value >= 0) {
            double _lowerLimit = widget.percentOfUpperCard;
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
      child: GestureDetector(
        onTap: () {
          if (widget.onCardClicked != null) {
            widget.onCardClicked(index % length);
          }
        },
        child: widget.creditCards[index % length],
      ),
    );
  }
}
