enum QuoteType {
  etf,
  brd,
  drn,
  preferenciaisClassesB,
  preferenciaisClassesC,
  preferenciaisClassesD,
}

enum Exchange {
  sao,
  nyq,
  nms,
  outra,
}

const Map<QuoteType, String> quoteTypeNames = {
  QuoteType.etf: 'ETF',
  QuoteType.brd: 'BRD',
  QuoteType.drn: 'DRN',
  QuoteType.preferenciaisClassesB: 'preferenciaisClassesB',
  QuoteType.preferenciaisClassesC: 'preferenciaisClassesC',
  QuoteType.preferenciaisClassesD: 'preferenciaisClassesD',
};

const Map<Exchange, String> exchangeFullNames = {
  Exchange.sao: 'B3',
  Exchange.nyq: 'NYSE',
  Exchange.nms: 'NasdaqGS',
  Exchange.outra: 'mainuma',
};

class Stock {
  Stock({
    required this.symbol,
    required this.displayName,
    required this.longName,
    required this.quoteType,
    required this.exchange,
    required this.image,
    this.isFavorite = false,
  });

  final String symbol;
  final String displayName;
  final String longName;
  final QuoteType quoteType;

  /// Exchange where the stock is traded.
  final Exchange exchange;

  final String image;

  /// Whether or not the stock has been saved to the user's favorites (i.e. marked as a favorite).
  bool isFavorite;
}
