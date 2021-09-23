import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:provider/provider.dart';
import 'package:stocks/data/app_state.dart';
import 'package:stocks/data/preferences.dart';
import 'package:stocks/screens/home.dart';
import 'package:stocks/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    RootRestorationScope(
      restorationId: 'root',
      child: StocksApp(),
    ),
  );
}

class StocksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StocksAppState();
}

class _StocksAppState extends State<StocksApp> with RestorationMixin {
  final _RestorableAppState _appState = _RestorableAppState();

  @override
  String get restorationId => 'wrapper';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_appState, 'state');
  }

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: _appState.value,
        ),
        ChangeNotifierProvider(
          create: (_) => Preferences()..load(),
        ),
      ],
      child: CupertinoApp(
        theme: Styles.stocksThemeData,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(restorationId: 'home'),
        restorationScopeId: 'app',
      ),
    );
  }
}

class _RestorableAppState extends RestorableListenable<AppState> {
  @override
  AppState createDefaultValue() {
    return AppState();
  }

  @override
  AppState fromPrimitives(Object? data) {
    final appState = AppState();
    final favorites = (data as List<dynamic>).cast<int>();
    for (var id in favorites) {
      appState.setFavorite(id, true);
    }
    return appState;
  }

  @override
  Object toPrimitives() {
    return value.favoriteStocks.map((stock) => stock.id).toList();
  }
}
