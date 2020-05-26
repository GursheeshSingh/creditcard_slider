import 'package:flutter/material.dart';

class CardCompany {
  static CardCompany americanExpress = CardCompany(
    Text(
      'AMERICAN \nEXPRESS',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );

  static CardCompany virgin = CardCompany(
    Image.asset(
      'images/virgin.png',
      height: 40,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany sbi = CardCompany(
    Image.asset(
      'images/sbi_card.gif',
      height: 35,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany sbiCard = CardCompany(
    Image.asset(
      'images/sbi.png',
      height: 35,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany kotak = CardCompany(
    Image.asset(
      'images/kotak_logo.png',
      height: 35,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany axisBank = CardCompany(
    Image.asset(
      'images/axis_bank_logo.png',
      height: 35,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany axisBankWhite = CardCompany(
    Image.asset(
      'images/axis_bank_logo.png',
      height: 35,
      color: Colors.white,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany citiBank = CardCompany(
    Image.asset(
      'images/citibank_logo.png',
      height: 25,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany hdfc = CardCompany(
    Image.asset(
      'images/hdfc_logo.png',
      height: 25,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany hsbc = CardCompany(
    Image.asset(
      'images/hsbc_logo.png',
      height: 30,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany icici = CardCompany(
    Image.asset(
      'images/icici_bank_logo.png',
      height: 25,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany indusland = CardCompany(
    Image.asset(
      'images/indusland.png',
      height: 15,
      package: 'credit_card_slider',
    ),
  );

  static CardCompany yesBank = CardCompany(
    Image.asset(
      'images/yes_bank_logo.png',
      height: 35,
      package: 'credit_card_slider',
    ),
  );

  final Widget widget;

  const CardCompany(this.widget);
}
