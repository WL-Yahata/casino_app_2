import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../model/tournament_information.dart';
import 'addTournament.dart';

class ListTournamentPage extends StatefulWidget {
  const ListTournamentPage({Key? key}) : super(key: key);

  @override
  State<ListTournamentPage> createState() => _ListTournamentPageState();
}

class _ListTournamentPageState extends State<ListTournamentPage> {
  List<TournamentInformation> TournamentList = [];

  Future<void> fetchTournamentInformation() async {
    final tournamentCollection =
        await FirebaseFirestore.instance.collection('TournamentList').get();
    final docs = tournamentCollection.docs;
    for (var doc in docs) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'スケジュールの管理',
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddTournamentPage()));
        },
        backgroundColor: Colors.black45,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: TournamentList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(TournamentList[index].tournamentName),
            );
          }),
    );
  }
}
