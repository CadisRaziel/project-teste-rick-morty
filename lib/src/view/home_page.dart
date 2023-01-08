import 'package:flutter/material.dart';
import 'package:rick_morty_api/src/model/results.dart';
import 'package:rick_morty_api/src/repository/results_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ResultsRepository repository = ResultsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testando'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Results>>(
            future: repository.findAllResults(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children:
                      snapshot.data!.map<Widget>((e) => Text(e.name)).toList(),
                );
              } else if (snapshot.hasError) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          )
        ],
      ),
    );
  }
}
