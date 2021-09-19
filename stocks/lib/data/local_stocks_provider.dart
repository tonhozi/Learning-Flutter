import 'package:flutter/cupertino.dart';
import 'package:stocks/data/stocks.dart';

class LocalStockProvider {
  static List<Stock> stocks = [
    Stock(
        id: 1,
        displayName: "INVESTO USTKCI",
        longName:
            "Investo ETF MSCI US Technology Fundo De Investimento De Indice – Investimento No Exterior",
        symbol: "USTK11.SA",
        imageAssetPath: "",
        quoteType: QuoteType.ordinaria,
        shortDescription: "shortDescription",
        accentColor: CupertinoColors.systemGrey,
        exchange: Exchange.SAO),
    Stock(
        id: 2,
        displayName: "WALT DISNEY DRN",
        longName: "The Walt Disney Company",
        symbol: "DISB34.SA",
        imageAssetPath: "",
        quoteType: QuoteType.ordinaria,
        shortDescription: "shortDescription",
        accentColor: CupertinoColors.systemBlue,
        exchange: Exchange.SAO),
    Stock(
        id: 3,
        displayName: "TESLA INC DRN",
        longName: "Tesla, Inc.",
        symbol: "TSLA34.SA",
        imageAssetPath: "",
        quoteType: QuoteType.ordinaria,
        shortDescription: "shortDescription",
        accentColor: CupertinoColors.systemRed,
        exchange: Exchange.SAO),
  ];
}
