import 'package:flutter/cupertino.dart';

enum StockCategory {
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

const Map<StockCategory, String> stockCategoryNames = {
  StockCategory.etf: 'ETF',
  StockCategory.brd: 'BRD',
  StockCategory.drn: 'DRN',
  StockCategory.preferenciaisClassesB: 'preferenciaisClassesB',
  StockCategory.preferenciaisClassesC: 'preferenciaisClassesC',
  StockCategory.preferenciaisClassesD: 'preferenciaisClassesD',
};

const Map<Exchange, String> exchangeFullNames = {
  Exchange.sao: 'São Paulo - B3',
  Exchange.nyq: 'New York Stock Exchange',
  Exchange.nms: 'Nasdaq',
  Exchange.outra: 'Outra',
};

class Stock {
  Stock({
    required this.id,
    required this.symbol,
    required this.displayName,
    required this.longName,
    required this.category,
    required this.exchange,
    required this.image,
    required this.accentColor,
    this.isFavorite = false,
  });

  final int id;
  final String symbol;
  final String displayName;
  final String longName;
  final StockCategory category;

  /// Exchange where the stock is traded.
  final Exchange exchange;

  final String image;

  /// A color value to use when constructing UI elements to match the image
  /// found at [imageAssetPath].
  final Color accentColor;

  /// Whether or not the stock has been saved to the user's favorites (i.e. marked as a favorite).
  bool isFavorite;

  String? get categoryName => stockCategoryNames[category];
  String? get exchangeName => exchangeFullNames[exchange];
}
