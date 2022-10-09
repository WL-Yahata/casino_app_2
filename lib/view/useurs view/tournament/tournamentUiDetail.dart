import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/tournament_information.dart';

class TournamentUiDetail extends StatefulWidget {
  const TournamentUiDetail({Key? key}) : super(key: key);

  @override
  State<TournamentUiDetail> createState() => _TournamentUiDetailState();
}

class _TournamentUiDetailState extends State<TournamentUiDetail> {
  @override

  //tournamentのリアルタイムで入手すべき情報
  TournamentInformation MyTournamentInformation = TournamentInformation(
    theNumberOfEntryPeople: 35,
    theNumberOfAlive: 5,
    theNumberOfEntry: 31,
    theNumberOfReEntry: 23,
    theNumberOfAddOn: 22,
    //あらかじめ店側に設定してもらうtornamentの情報
    tournamentName: 'Sunday Main Tournament',
    whichReEntry: 'あり',
    whichAddOn: 'あり',
    startStack: '20000',
    addOnStack: '15000',
    timeOfBlind: '15',
    entryFee: '3000',
    reEntryFee: '3000',
    addOnFee: '2000',
  );

  //stack等を計算させるコード
  int get theNumberOfAlive => MyTournamentInformation.theNumberOfAlive;
  int get theNumberOfEntry => MyTournamentInformation.theNumberOfEntry;
  int get theNumberOfReEntry => MyTournamentInformation.theNumberOfReEntry;
  int get theNumberOfAddOn => MyTournamentInformation.theNumberOfAddOn;
  int get startStack => int.parse(MyTournamentInformation.startStack);
  int get addOnStack => int.parse(MyTournamentInformation.addOnStack);

  int avel(int theNumberOfAlive, int theNumberOfEntry, int theNumberOfReEntry,
      int theNumberOfAddOn, int startStack, int addOnStack) {
    return (theNumberOfEntry * startStack +
            theNumberOfReEntry * startStack +
            theNumberOfAddOn * addOnStack) ~/
        theNumberOfAlive;
  } //stack等を計算させるコード、ここまで

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'tournament',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            MyTournamentInformation.tournamentName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyTournamentInformation.theNumberOfAlive.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                    const Text(
                      '/',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      MyTournamentInformation.theNumberOfEntry.toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'average  : ',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Text(
                      avel(
                              theNumberOfAlive,
                              theNumberOfEntry,
                              theNumberOfReEntry,
                              theNumberOfAddOn,
                              startStack,
                              addOnStack)
                          .toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'add on   : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    Text(MyTournamentInformation.theNumberOfAddOn.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rebuy   : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    Text(MyTournamentInformation.theNumberOfReEntry.toString()),
                  ],
                ),
              ],
            ),
          ), //entryなど
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.all(0.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Re Entry',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    Text(
                      MyTournamentInformation.whichReEntry,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    const Text(
                      '   AddOn  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    Text(
                      MyTournamentInformation.whichAddOn,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Start Stack  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    Text(
                      MyTournamentInformation.startStack.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    const Text(
                      '   AddOn stack  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    Text(
                      MyTournamentInformation.addOnStack.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '  Blind Time  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    Text(
                      MyTournamentInformation.timeOfBlind.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ), //細かいルール
          Container(), //table
        ],
      ),
    );
  }
}
