import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_slider.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

Color kPink = Color(0xFFEE4CBF);
Color kRed = Color(0xFFFA3754);
Color kBlue = Color(0xFF4AA3F2);
Color kPurple = Color(0xFFAF92FB);

class _HomePageState extends State<HomePage> {
  List<CreditCard> _creditCards = [];

  @override
  void initState() {
    super.initState();

    _creditCards = [
      // CreditCard(
      //   cardBackground: SolidColorCardBackground(Colors.black.withOpacity(0.6)),
      //   cardNetworkType: CardNetworkType.visaBasic,
      //   cardHolderName: Text('The boring developer'),
      //   cardNumber: Text('1234 1234 1234 1234'),
      //   company: CardCompany.yesBank,
      //   validity: Validity(
      //     validThruMonth: 1,
      //     validThruYear: 21,
      //     validFromMonth: 1,
      //     validFromYear: 16,
      //   ),
      // ),
      // CreditCard(
      //   cardBackground: SolidColorCardBackground(kRed.withOpacity(0.4)),
      //   cardNetworkType: CardNetworkType.mastercard,
      //   // cardHolderName: 'Gursheesh Singh',
      //   cardNumber: Text('1234 1234 1234 1234'),
      //   company: CardCompany.kotak,
      //   validity: Validity(
      //     validThruMonth: 1,
      //     validThruYear: 21,
      //   ),
      // ),
      // CreditCard(
      //   cardBackground: GradientCardBackground(LinearGradient(
      //     begin: Alignment.centerLeft,
      //     end: Alignment.centerRight,
      //     colors: [kBlue, kPurple],
      //     stops: [0.3, 0.95],
      //   )),
      //   cardNetworkType: CardNetworkType.mastercard,
      //   // cardHolderName: 'Very Very very boring devloper',
      //   cardNumber: Text('1234 1234 1234 1234'),
      //   company: CardCompany.sbiCard,
      //   validity: Validity(
      //     validThruMonth: 2,
      //     validThruYear: 2021,
      //   ),
      // ),
      // CreditCard(
      //   cardBackground:
      //       ImageCardBackground(AssetImage('images/background_sample.jpg')),
      //   cardNetworkType: CardNetworkType.mastercard,
      //   // cardHolderName: 'John Doe',
      //   cardNumber: Text('1234 1234 1234 1234'),
      //   company: CardCompany.virgin,
      //   validity: Validity(
      //     validThruMonth: 1,
      //     validThruYear: 20,
      //   ),
      // ),
      CreditCard(
           cardBackground: GradientCardBackground(LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kBlue, kPurple],
          stops: [0.3, 0.95],
        )),
     //   cardNetworkType: CardNetworkType.rupay,
        customWidget:Text("mohanand", style: TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),),
        // cardHolderName: 'THE BORING DEVELOPER',
       // cardNumber: Text('1234 1234 1234 1234'),
       // company: CardCompany.sbi,
      ),
       CreditCard(
           cardBackground: GradientCardBackground(LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.green, kPurple],
          stops: [0.3, 0.95],
        )),
        showChip:false,
     //   cardNetworkType: CardNetworkType.rupay,
        customWidget:Text("mohanand", style: TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),),
        // cardHolderName: 'THE BORING DEVELOPER',
       // cardNumber: Text('1234 1234 1234 1234'),
       // company: CardCompany.sbi,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreditCardSlider(
          _creditCards,
          repeatCards: true,
          onCardClicked: (index) {
            print('Clicked at index: $index');
          },
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
