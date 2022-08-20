// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_is_empty
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'home.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.robotoMono().fontFamily,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

int r = 40; //number of results to show.

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=$r&page=1&sparkline=false"));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load ! Error!');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 15), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "CRYPTO TRACKER",
          style: TextStyle(
              color: Colors.green[500],
              fontSize: 26,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.white10,
          thickness: 2,
        ),
        itemBuilder: ((context, index) {
          return CoinCard(
              name: coinList[index].name,
              symbol: coinList[index].symbol,
              imageurl: coinList[index].imageurl,
              price: coinList[index].price.toDouble(),
              change: coinList[index].change.roundToDouble(),
              changePercentage: coinList[index].changePercentage.toDouble(),
              total_volume: coinList[index].total_volume.toDouble(),
              high_24h: coinList[index].high_24h.toDouble(),
              low_24h: coinList[index].low_24h.toDouble(),
              market_cap: coinList[index].market_cap.toDouble(),
              circulating_supply:
                  coinList[index].circulating_supply.toDouble());
        }),
      ),
    );
  }
}
