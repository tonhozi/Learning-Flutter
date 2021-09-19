import 'package:stocks/data/stocks.dart';

class LocalStockProvider {
  static List<Stock> stocks = [
    Stock(
        displayName: "INVESTO USTKCI",
        longName:
            "Investo ETF MSCI US Technology Fundo De Investimento De Indice – Investimento No Exterior",
        symbol: "USTK11.SA",
        quoteType: QuoteType.etf,
        exchange: Exchange.sao),
    Stock(
        displayName: "WALT DISNEY DRN",
        longName: "The Walt Disney Company",
        symbol: "DISB34.SA",
        quoteType: QuoteType.drn,
        exchange: Exchange.sao,
        isFavorite: true),
    Stock(
        displayName: "TESLA INC DRN",
        longName: "Tesla, Inc.",
        symbol: "TSLA34.SA",
        quoteType: QuoteType.drn,
        exchange: Exchange.sao),
  ];
}
