import 'package:flutter/foundation.dart';
import 'package:stocks/data/local_stocks_provider.dart';
import 'package:stocks/data/stocks.dart';

class AppState extends ChangeNotifier {
  final List<Stock> _stocks;

  AppState() : _stocks = LocalStockProvider.stocks;

  List<Stock> get allStocks => List<Stock>.from(_stocks);

  List<Stock> get favoriteStocks => _stocks.where((s) => s.isFavorite).toList();

  Stock getStock(String symbol) =>
      _stocks.singleWhere((v) => v.symbol == symbol);

  List<Stock> searchStocks(String terms) => _stocks
      .where((s) => s.longName.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(String symbol, bool isFavorite) {
    var stock = getStock(symbol);
    stock.isFavorite = isFavorite;
    notifyListeners();
  }
}
