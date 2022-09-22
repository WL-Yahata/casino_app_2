import 'package:casino_app_2/view/useurs%20view/cashing/cashingPage.dart';
import 'package:casino_app_2/view/useurs%20view/order/orderPage.dart';
import 'package:casino_app_2/view/useurs%20view/schedule/schedulePage.dart';
import 'package:casino_app_2/view/useurs%20view/tournament/tournamentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const CashingPade(),
    const TournamentPage(),
    const OrderPage(),
    const SchedulePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.balance,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bakery_dining,
                color: Colors.black45,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.black45,
              ),
              label: ''),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
