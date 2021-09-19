import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stocks/data/app_state.dart';
import 'package:stocks/data/preferences.dart';
import 'package:stocks/data/stocks.dart';
import 'package:stocks/styles.dart';
import 'package:stocks/widgets/stock_card.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  Widget _generateStockRow(Stock stock, Preferences prefs) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: FutureBuilder<Set<QuoteType>>(
          // future: prefs.preferredCategories,
          builder: (context, snapshot) {
        final data = snapshot.data ?? <QuoteType>{};
        return StockCard(stock, data.contains(stock.quoteType));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      restorationScopeId: restorationId,
      builder: (context) {
        var dateString = DateFormat('d MMMM y').format(DateTime.now());

        final appState = Provider.of<AppState>(context);
        final prefs = Provider.of<Preferences>(context);
        final themeData = CupertinoTheme.of(context);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarBrightness: MediaQuery.platformBrightnessOf(context)),
          child: SafeArea(
            bottom: false,
            child: ListView.builder(
              restorationId: 'list',
              itemCount: appState.allStocks.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dateString.toUpperCase(),
                            style: Styles.minorText(themeData)),
                        Text('Olá, Pedro Tonhozi',
                            style: Styles.headlineText(themeData)),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xff7c94b6),
                            border: Border.all(
                              width: 2,
                              color: CupertinoColors.activeOrange,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          margin: const EdgeInsets.only(top: 8.0),
                          height: 100,
                          constraints: const BoxConstraints.expand(
                            height: 260.0,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (index <= appState.allStocks.length) {
                  return _generateStockRow(
                    appState.allStocks[index - 1],
                    prefs,
                  );
                } else {
                  var relativeIndex = index - (appState.allStocks.length + 2);
                  return _generateStockRow(
                      appState.allStocks[relativeIndex], prefs);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
