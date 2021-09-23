import 'package:flutter/cupertino.dart';
import 'package:stocks/data/stocks.dart';

class LocalStockProvider {
  static List<Stock> stocks = [
    Stock(
      id: 01,
      displayName: "INVESTO USTKCI",
      longName:
          "Investo ETF MSCI US Technology Fundo De Investimento De Indice – Investimento No Exterior",
      symbol: "USTK11.SA",
      category: StockCategory.etf,
      image: "",
      exchange: Exchange.sao,
      accentColor: const Color(0x40de8c66),
    ),
    Stock(
      id: 02,
      displayName: "WALT DISNEY DRN",
      longName: "The Walt Disney Company",
      symbol: "DISB34.SA",
      category: StockCategory.drn,
      exchange: Exchange.sao,
      image: 'assets/images/disney.jpg',
      isFavorite: true,
      accentColor: const Color(0x40de8c66),
    ),
    Stock(
      id: 03,
      displayName: "TESLA INC DRN",
      longName: "Tesla, Inc.",
      symbol: "TSLA34.SA",
      category: StockCategory.drn,
      exchange: Exchange.sao,
      image: 'assets/images/tesla.jpg',
      accentColor: const Color(0x40de8c66),
    ),
  ];
}
