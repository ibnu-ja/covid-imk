import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';

class World extends StatelessWidget {
  final double height;
  final data;

  World({this.height, this.data});

  @override
  Widget build(BuildContext context) {
    print(data);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: const Text(
            'LAPORAN KASUS DUNIA',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: GridView.count(
        //     crossAxisCount: 3,
        //     childAspectRatio: height / 430,
        //     children: <Widget>[
        //       SummaryCard(
        //         total: data.summary.newconfirmed,
        //         label: 'Positif',
        //         color: Colors.yellow[100],
        //         size: 20,
        //       ),
        //       new SummaryCard(
        //         total: data.summary.newrecovered,
        //         label: 'Sembuh',
        //         color: Colors.greenAccent[100],
        //         size: 20,
        //       ),
        //       SummaryCard(
        //         total: data.summary.newdeaths,
        //         label: 'Meninggal',
        //         color: Colors.red[300],
        //         size: 20,
        //       ),
        //     ],
        //   ),
        // ),
        Text('Pembaruan Terakhir'),
        Text(data.updated),
      ],
    );
  }
}
