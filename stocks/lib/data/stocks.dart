import 'package:flutter/cupertino.dart';

enum QuoteType {
  ordinaria,
  preferencial,
  preferenciaisClassesA,
  preferenciaisClassesB,
  preferenciaisClassesC,
  preferenciaisClassesD,
}

enum Exchange {
  SAO,
  NYQ,
  NMS,
  outra,
}

const Map<QuoteType, String> quoteTypeNames = {
  QuoteType.ordinaria: 'ordinaria',
  QuoteType.preferencial: 'preferencial',
  QuoteType.preferenciaisClassesA: 'preferenciaisClassesA',
  QuoteType.preferenciaisClassesB: 'preferenciaisClassesB',
  QuoteType.preferenciaisClassesC: 'preferenciaisClassesC',
  QuoteType.preferenciaisClassesD: 'preferenciaisClassesD',
};

const Map<Exchange, String> exchangeFullNames = {
  Exchange.SAO: 'B3',
  Exchange.NYQ: 'NYSE',
  Exchange.NMS: 'NasdaqGS',
  Exchange.outra: 'mainuma',
};

class Stock {
  Stock({
    required this.id,
    required this.displayName,
    required this.longName,
    required this.symbol,
    required this.imageAssetPath,
    required this.quoteType,
    required this.shortDescription,
    required this.accentColor,
    required this.exchange,
    this.isFavorite = false,
  });

  final int id;

  final String displayName;

  final String longName;

  final String symbol;

  /// Each stock has an associated image asset that's used as a background image and icon.
  final String imageAssetPath;

  final QuoteType quoteType;

  /// A short, snappy line.
  final String shortDescription;

  /// A color value to use when constructing UI elements to match the image
  /// found at [imageAssetPath].
  final Color accentColor;

  /// Exchange where the stock is traded.
  final Exchange exchange;

  /// Whether or not the stock has been saved to the user's favorites (i.e. marked as a favorite).
  bool isFavorite;
}
