// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinCard extends StatelessWidget {
  CoinCard(
      {Key? key,
      required this.name,
      required this.symbol,
      required this.imageurl,
      required this.price,
      required this.change,
      required this.changePercentage,
      required this.total_volume,
      required this.high_24h,
      required this.low_24h,
      required this.market_cap,
      required this.circulating_supply})
      : super(key: key);

  String name;
  String symbol;
  String imageurl;
  double price;
  double change;
  double changePercentage;
  double total_volume;
  double high_24h;
  double low_24h;
  double market_cap;
  double circulating_supply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 285,
        child: Card(
          elevation: 5,
          color: Colors.black,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: CircleAvatar(
                        //backgroundImage: NetworkImage(imageurl),
                        backgroundColor: Colors.white,
                        foregroundImage: NetworkImage(imageurl),
                        radius: 26,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name + "",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          symbol,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat.simpleCurrency(
                                locale: 'hi-IN', decimalDigits: 2)
                            .format(price.toDouble().toInt())
                            .toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        change.toDouble().toString()[0] == "-"
                            ? '' + change.toDouble().toString()
                            : '+' + change.toDouble().toString(),
                        style: TextStyle(
                            color: change.toDouble().toString()[0] == "-"
                                ? Colors.red
                                : Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        changePercentage.toDouble().toString()[0] == "-"
                            ? '' + changePercentage.toDouble().toString() + '%'
                            : '+' +
                                changePercentage.toDouble().toString() +
                                '%',
                        style: TextStyle(
                            color:
                                changePercentage.toDouble().toString()[0] == "-"
                                    ? Colors.red
                                    : Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CircSupply = " +
                                circulating_supply
                                    .toDouble()
                                    .round()
                                    .toString() +
                                " " +
                                symbol.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Mark-Cap = " +
                                NumberFormat.simpleCurrency(
                                        locale: 'hi-IN', decimalDigits: 2)
                                    .format(market_cap.toDouble().toInt())
                                    .toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Vol = " +
                                NumberFormat.simpleCurrency(
                                        locale: 'hi-IN', decimalDigits: 2)
                                    .format(total_volume.toDouble().toInt())
                                    .toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Day High - " + high_24h.toDouble().toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green[300],
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Day Low - " + low_24h.toDouble().toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      changePercentage.toDouble().toString()[0] == "-"
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                      color: changePercentage.toDouble().toString()[0] == "-"
                          ? Colors.red
                          : Colors.green,
                      size: 50,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Last 24h  ",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    //THIS MINI GRAPH IS RANDOM ONLY FOR UI
                    //    ////////////      ///////////
                    child: SfCartesianChart(
                        borderWidth: 0,
                        borderColor: Colors.black,
                        plotAreaBorderColor: Colors.black,
                        //margin: EdgeInsets.all(100),
                        primaryXAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            axisLine: AxisLine(width: 0),
                            isVisible: false,
                            labelStyle: const TextStyle(fontSize: 0)),
                        primaryYAxis: NumericAxis(
                            borderColor: Colors.black,
                            majorGridLines: MajorGridLines(width: 0),
                            isVisible: false,
                            labelStyle: const TextStyle(
                                fontSize: 5, color: Colors.white),
                            axisLine: AxisLine(width: 0)),
                        series: <ChartSeries>[
                          // Renders line chart
                          LineSeries<SalesData, int>(
                              dataSource:
                                  changePercentage.toDouble().toString()[0] ==
                                          "-"
                                      ? <SalesData>[
                                          SalesData(-2, high_24h.toInt()),
                                          SalesData(5, high_24h.toInt()),
                                          SalesData(
                                              10,
                                              low_24h.toInt() +
                                                  Random().nextInt(100)),
                                          SalesData(20, price.toInt()),
                                          SalesData(24, high_24h.toInt()),
                                          SalesData(27, high_24h.toInt()),
                                          SalesData(29, price.toInt()),
                                          SalesData(
                                              32,
                                              low_24h.toInt() +
                                                  Random().nextInt(100)),
                                          SalesData(34, low_24h.toInt()),
                                        ]
                                      : <SalesData>[
                                          SalesData(
                                              1,
                                              low_24h.toInt() +
                                                  Random().nextInt(100)),
                                          SalesData(2, low_24h.toInt()),
                                          SalesData(3, high_24h.toInt()),
                                          SalesData(
                                              4,
                                              price.toInt() +
                                                  Random().nextInt(100)),
                                          SalesData(5, low_24h.toInt()),
                                          SalesData(6, high_24h.toInt()),
                                          SalesData(7, price.toInt()),
                                          SalesData(8, high_24h.toInt()),
                                          SalesData(9, price.toInt()),
                                        ],
                              color:
                                  changePercentage.toDouble().toString()[0] ==
                                          "-"
                                      ? Colors.red
                                      : Colors.green,
                              xValueMapper: (SalesData sales, _) => sales.a,
                              yValueMapper: (SalesData sales, _) => sales.m)
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.a, this.m);
  final int a;
  final int m;
}
