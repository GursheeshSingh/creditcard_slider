import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'card_background.dart';
import 'card_company.dart';
import 'card_network_type.dart';
import 'validity.dart';

class CreditCard extends StatelessWidget {
  final CardBackground cardBackground;
  final CardNetworkType cardNetworkType;
  final Widget customWidget;
  final CardCompany company;
  final Widget cardHolderName;
  final Widget cardNumber;
  final double roundedCornerRadius;
  final Validity validity;
  final Color numberColor;
  final Color validityColor;
  final Color cardHolderNameColor;
  final bool showChip;

  const CreditCard({
    @required this.cardBackground,
    this.cardNetworkType,
    this.customWidget,
    this.cardNumber,
    this.cardHolderName,
    this.company,
    this.validity,
    this.roundedCornerRadius = 20,
    this.numberColor = Colors.white,
    this.validityColor = Colors.white,
    this.cardHolderNameColor = Colors.white,
    this.showChip = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width:MediaQuery.of(context).size.height<900 ? MediaQuery.of(context).size.width*0.9:MediaQuery.of(context).size.width*0.70,
      height: MediaQuery.of(context).size.height<900 ? MediaQuery.of(context).size.height*0.25:MediaQuery.of(context).size.height*0.3,
      decoration: _buildBackground(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: customWidget!=null?Stack(
      
        children: <Widget>[
        customWidget,
          showChip ? _buildChip(context) : SizedBox.shrink(),
        
        ],
      ): Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          company != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: company.widget,
                )
              : SizedBox.shrink(),
          showChip ? _buildChip(context) : SizedBox.shrink(),
          Column(
            children: <Widget>[
              _buildCardNumber(),
              SizedBox(height: 4),
              _buildValidity(),
              SizedBox(height: 4),
              _buildNameAndCardNetworkType(),
            ],
          ),
        ],
      ),
    );
  }

  _buildBackground() {
    if (cardBackground is SolidColorCardBackground) {
      SolidColorCardBackground solidColorCardBackground = cardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        color: solidColorCardBackground.backgroundColor,
      );
    } else if (cardBackground is GradientCardBackground) {
      GradientCardBackground gradientCardBackground = cardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        gradient: gradientCardBackground.gradient,
      );
    } else if (cardBackground is ImageCardBackground) {
      ImageCardBackground imageCardBackground = cardBackground;
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        image: imageCardBackground.build(),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCornerRadius),
        color: Colors.black,
      );
    }
  }

  _buildChip(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'images/chip.png',
        height: MediaQuery.of(context).size.height*0.04,
        package: 'credit_card_slider',
      ),
    );
  }

  _buildCardNumber() {
    if (cardNumber == null ) {
      return SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: cardNumber,
    );
  }

  _buildValidity() {
    if (validity == null) {
      return SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        validity.validFromMonth != null || validity.validFromYear != null
            ? Column(
                children: <Widget>[
                  Text(
                    'VALID FROM',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${validity.validFromMonth.toString().padLeft(2, '0')}/${validity.validFromYear.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: validityColor,
                      fontSize: 10,
                      fontFamily: 'creditcard',
                      package: 'credit_card_slider',
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
        validity.validFromMonth != null || validity.validFromYear != null
            ? SizedBox(width: 24)
            : SizedBox.shrink(),
        Column(
          children: <Widget>[
            Text(
              'VALID THRU',
              style: TextStyle(
                color: validityColor,
                fontSize: 8,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '${validity.validThruMonth.toString().padLeft(2, '0')}/${validity.validThruYear.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: validityColor,
                fontSize: 10,
                fontFamily: 'creditcard',
                package: 'credit_card_slider',
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildNameAndCardNetworkType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        cardHolderName != null
            ? Expanded(
                flex: 3,
                child:
                  cardHolderName,
               
              )
            : SizedBox.shrink(),
        SizedBox(width: 16),
        Expanded(
          child: _buildCardNetworkType(),
        )
      ],
    );
  }

  _buildCardNetworkType() {
    if (cardNetworkType == null) {
      return SizedBox.shrink();
    }
    return cardNetworkType.widget;
  }
}
