class Coin {
  Coin(
      {required this.name,
      required this.symbol,
      required this.imageurl,
      required this.price,
      required this.change,
      required this.changePercentage,
      required this.total_volume,
      required this.high_24h,
      required this.low_24h,
      required this.market_cap,
      required this.circulating_supply});

  String name;
  String symbol;
  String imageurl;
  num price;
  num change;
  num changePercentage;
  num total_volume;
  num high_24h;
  num low_24h;
  num market_cap;
  num circulating_supply;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
        name: json['name'],
        symbol: json['symbol'],
        imageurl: json['image'],
        price: json['current_price'],
        change: json['price_change_24h'],
        changePercentage: json['price_change_percentage_24h'],
        total_volume: json['total_volume'],
        high_24h: json['high_24h'],
        low_24h: json['low_24h'],
        market_cap: json['market_cap'],
        circulating_supply: json['circulating_supply']);
  }
}

List<Coin> coinList = [];
