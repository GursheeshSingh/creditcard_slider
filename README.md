# Credit Card Slider - Flutter

This project provides a credit card slider

## Screenshots

**IMPORTANT:** Check github for screenshots

![Demo 1](/screenshots/screenshot_1.gif)

## Creating Credit Cards

### Basic Credit card

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.red),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
    ),

![Basic card](/screenshots/basic_card.png)

* Creates a credit card with a solid background of red color
* Credit card of type visa
* Shows a card holder name

### Card Background Types

* Solid Color
* Gradient
* Image

### Credit card with Gradient background

    CreditCard(
        cardBackground: GradientCardBackground(LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF4AA3F2), Color(0xFFAF92FB)],
          stops: [0.3, 0.95],
        )),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
    )

![Gradient card](/screenshots/gradient_card.png)

### Credit card with Image background

    CreditCard(
        cardBackground:
            ImageCardBackground(AssetImage('images/background_sample.jpg')),
        cardNetworkType: CardNetworkType.rupay,
        cardHolderName: 'The boring developer',
    )

![Image card](/screenshots/image_card.png)

### Adding Credit card number

***cardNumber*** field of type string

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 1234 1234 1234',
    )

![Image card](/screenshots/credit_card_with_number.png)

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
    )

![Image card](/screenshots/credit_card_with_hidden_numbers.png)

### Adding a credit card company

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.hdfc,
    )

![Image card](/screenshots/hdfc_credit_card.png)

### Creating a custom company card

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany(Image.asset(imagePath)),
    )

**NOTE:** - List of companies available at end

### Adding Valid Till

**NOTE:** If Validity is added, valid thru must be added. Valid from is optional

      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.purple),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.sbi,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,      
        ),
      ),

![Image card](/screenshots/valid_till_card.png)

### Adding Valid From and Valid Till

      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.purple),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.sbi,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),

![Image card](/screenshots/valid_from_card.png)

### Hiding chip

Set ***showChip*** to false

      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.purple),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.sbi,
        showChip: false,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
      ),

![Image card](/screenshots/hiding_chip.png)

### Changing Text color

      CreditCard(
        cardBackground: SolidColorCardBackground(Colors.white),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.sbi,
        validity: Validity(
          validThruMonth: 1,
          validThruYear: 21,
          validFromMonth: 1,
          validFromYear: 16,
        ),
        numberColor: Colors.black,
        validityColor: Colors.black,
        cardHolderNameColor: Colors.black,
      ),

![Image card](/screenshots/white_card_black_text.png)

### List of companies

* American Express

        company: CardCompany.americanExpress

![Image card](/screenshots/american_express.png)

* AxisBank

        company: CardCompany.axisBank

![Image card](/screenshots/axis_bank_card.png)

        company: CardCompany.axisBankWhite

![Image card](/screenshots/axis_bank_white_card.png)

* Citi Bank

        company: CardCompany.citiBank

![Image card](/screenshots/citi_bank_card.png)

* HDFC
* HSBC

        company: CardCompany.hsbc

![Image card](/screenshots/hsbc_card.png)

* ICICI

        company: CardCompany.icici

![Image card](/screenshots/icici_card.png)

* INDUSLAND

        company: CardCompany.indusland

![Image card](/screenshots/indusland_card.png)

* Kotak

        company: CardCompany.kotak

![Image card](/screenshots/kotak_card.png)

* SBI

        company: CardCompany.sbi

![Image card](/screenshots/sbi_card.png)

* Virgin

        company: CardCompany.virgin

![Image card](/screenshots/virgin_card.png)

* YESBANK

        company: CardCompany.yesBank

![Image card](/screenshots/yes_bank_card.png)

