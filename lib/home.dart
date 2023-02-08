import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample/coin_page.dart';
import 'chart.dart';

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
      required this.circulating_supply,
      required this.graph_list})
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
  List<dynamic> graph_list;

  final redShadowColor = Color.fromARGB(66, 255, 137, 129);
  final greenShadowColor = Color.fromARGB(97, 76, 175, 79);
  final blueShadowColor = Color.fromARGB(75, 33, 149, 243);
  @override
  Widget build(BuildContext context) {
    List<FlSpot> flSpotList = graph_list
        .whereType<double>()
        .map((value) => FlSpot(graph_list.indexOf(value).toDouble(), value))
        .toList();
    double maxX;
    double maxY;
    if (symbol == 'btc' || symbol == 'wbtc') {
      maxX = 170;
      maxY = graph_list[0] / 4; //6000
    } else if (symbol == 'eth' ||
        symbol == 'steth' ||
        symbol == 'paxg' ||
        symbol == 'mkr' ||
        symbol == 'reth' ||
        symbol == 'xaut') {
      maxX = 170;
      maxY = graph_list[0] / 5; //410
    } else if (price < 100.00) {
      maxX = 170;
      maxY = graph_list[0] / 4; //0.27
    } else {
      maxX = 170;
      maxY = graph_list[0] / 4; //80
    }
    return RaisedButton(
      color: Colors.black,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoinPage(
              symbol: symbol,
              name: name,
              price: price,
              graph_list: graph_list,
              imageurl: imageurl,
              changePercentage: changePercentage,
              change: change,
              high_24h: high_24h,
              low_24h: low_24h,
            ),
          ),
        );
      },
      child: Container(
        height: 310,
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
                                  fontSize: name.length > 11 ? 14 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          symbol,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
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
                        style: const TextStyle(
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
                            "Supply   : " +
                                circulating_supply
                                    .toDouble()
                                    .round()
                                    .toString() +
                                " " +
                                symbol.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "Mark Cap : " +
                                NumberFormat.simpleCurrency(
                                        locale: 'hi-IN', decimalDigits: 2)
                                    .format(market_cap.toDouble().toInt())
                                    .toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Volume   : " +
                                NumberFormat.simpleCurrency(
                                        locale: 'hi-IN', decimalDigits: 2)
                                    .format(total_volume.toDouble().toInt())
                                    .toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          // Text(
                          //   "Day High : " + high_24h.toDouble().toString(),
                          //   style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.green[300],
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // Text(
                          //   "Day Low  : " + low_24h.toDouble().toString(),
                          //   style: TextStyle(
                          //       fontSize: 14,
                          //       color: Colors.red,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            "\nLast 7 days : ",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: changePercentage.toDouble().toString()[0] == "-"
                          ? SizedBox(
                              height: 15,
                              width: 110,
                              child: LineChart(sampleData(
                                  flSpotList, red, redBack, maxX, maxY)),
                            )
                          : SizedBox(
                              height: 15,
                              width: 110,
                              child: LineChart(sampleData(
                                  flSpotList, green, greenBack, maxX, maxY)),
                            ),
                    )
                    // ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
