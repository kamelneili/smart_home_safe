import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          // check balance ,
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartPieN(
              data: [
                NumericData(domain: 1, measure: 4, color: Colors.red),
                NumericData(domain: 2, measure: 3, color: Colors.blue),
                NumericData(domain: 3, measure: 4, color: Colors.blue[800]),
              ],
            ),
          ),
          const Center(
              child: Text(
            '',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          const Center(child: Text('')),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Earning'),
              Text('Spend'),
              Text('Available'),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Text('),
              //Text('587.7'),
              //Text('729.4'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Transactions'),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartLineT(
              groupList: [
                TimeGroup(id: '1', data: [
                  TimeData(domain: DateTime.now(), measure: 1),
                  TimeData(domain: DateTime(2023, 3, 01), measure: 2),
                  TimeData(domain: DateTime(2024, 2, 30), measure: 3),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
