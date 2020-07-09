# Credit Card Slider - Flutter

This project provides a credit card slider

## Screenshots

![Demo 1](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/screenshot_1.gif)

## Creating Credit Cards

### Basic Credit card

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.red),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
    ),

![](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/basic_card.png)

* Creates a credit card with a solid background of red color
* Credit card of type visa
* Shows a card holder name

## Creating Card Slider

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CreditCardSlider(
              _creditCards, //List of credit cards
            ),
          ),
        );
    }

### Changing percent of upper card shown

Use field ***percentOfUpperCard*** of **CreditCardSlider**

**NOTE:** Value must lie between 0 and pi / 2

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CreditCardSlider(
              _creditCards,
              percentOfUpperCard: pi / 2,
            ),
          ),
        );
    }

![Demo 1](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/screenshot_2.gif)

## Specify initial card
**NOTE:** Added in 1.0.1

You can also specify initial card index to appear in slider

* initialCard is 0 index based
* If not specified, initialCard is 0

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CreditCardSlider(
              _creditCards,
              initialCard: 2,
            ),
          ),
        );
      }

## Repeat cards
**NOTE:** Added in 1.0.1

You can also repeat cards in down or both direction (up and down)

### Repeat in down direction only

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CreditCardSlider(
              _creditCards,
              repeatCards: RepeatCards.down,
            ),
          ),
        );
      }

![Demo 1](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/screenshot_3.gif)

### Repeat in both direction

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: CreditCardSlider(
              _creditCards,
              repeatCards: RepeatCards.bothSides,
            ),
          ),
        );
      }

![Demo 1](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/screenshot_4.gif)


## Card click listener

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: CreditCardSlider(
                    _creditCards,
                    onCardClicked: (index) {
                        print('Clicked at index: $index');
                    },
                ),
            ),
        );
    }

* Added in 1.0.0+2

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

![Gradient card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/gradient_card.png)

### Credit card with Image background

    CreditCard(
        cardBackground:
            ImageCardBackground(AssetImage('images/background_sample.jpg')),
        cardNetworkType: CardNetworkType.rupay,
        cardHolderName: 'The boring developer',
    )

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/image_card.png)

### Adding Credit card number

***cardNumber*** field of type string

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 1234 1234 1234',
    )

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/credit_card_with_number.png)

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
    )

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/credit_card_with_hidden_numbers.png)

### Adding a credit card company

    CreditCard(
        cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
        cardNetworkType: CardNetworkType.visaBasic,
        cardHolderName: 'The boring developer',
        cardNumber: '1234 **** **** ****',
        company: CardCompany.hdfc,
    )

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/hdfc_credit_card.png)

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

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/valid_till_card.png)

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

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/valid_from_card.png)

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

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/hiding_chip.png)

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

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/white_card_black_text.png)

### List of companies

* American Express

        company: CardCompany.americanExpress

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/american_express.png)

* AxisBank

        company: CardCompany.axisBank

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/axis_bank_card.png)

        company: CardCompany.axisBankWhite

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/axis_bank_white_card.png)

* Citi Bank

        company: CardCompany.citiBank

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/citi_bank_card.png)

* HDFC

* HSBC

        company: CardCompany.hsbc

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/hsbc_card.png)

* ICICI

        company: CardCompany.icici

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/icici_card.png)

* INDUSLAND

        company: CardCompany.indusland

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/indusland_card.png)

* Kotak

        company: CardCompany.kotak

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/kotak_card.png)

* SBI

        company: CardCompany.sbi

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/sbi_card.png)

* Virgin

        company: CardCompany.virgin

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/virgin_card.png)

* YESBANK

        company: CardCompany.yesBank

![Image card](https://github.com/GursheeshSingh/creditcard_slider/raw/master/screenshots/yes_bank_card.png)

