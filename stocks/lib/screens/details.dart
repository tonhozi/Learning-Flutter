import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stocks/data/app_state.dart';
import 'package:stocks/data/preferences.dart';
import 'package:stocks/data/stocks.dart';
import 'package:stocks/styles.dart';
import 'package:stocks/widgets/close_button.dart';

class StockInfoChart extends StatelessWidget {
  const StockInfoChart(this.stock, this.prefs);

  final Stock stock;

  final Preferences prefs;

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    const longStory =
        'Here is where the about section will go in the future, but it is not implemented yet. '
        'For example, for DISB34.SA we could say "The Walt Disney Company, together with its subsidiaries, '
        'operates as an entertainment company worldwide. The company\'s Media Networks segment operates domestic '
        'cable networks under the Disney, ESPN, Freeform, FX, and National Geographic brands; and television '
        'broadcast network under the ABC brand, as well as eight domestic television stations. This segment '
        'is also involved in the television production and distribution. Its Parks, Experiences and Products '
        'segment operates theme parks and resorts, such as Walt Disney World Resort in Florida; Disneyland Resort '
        'in California; Disneyland Paris; Hong Kong Disneyland Resort; and Shanghai Disney Resort; Disney Cruise '
        'Line, Disney Vacation Club, National Geographic Expeditions, and Adventures by Disney and Aulani, a Disney '
        'resort and spa in Hawaii, as well as licenses its intellectual property to a third party for the operations '
        'of the Tokyo Disney Resort in Japan. The company\'s Studio Entertainment segment produces and distributes '
        'motion pictures under the Walt Disney Pictures, Twentieth Century Studios, Marvel, Lucasfilm, Pixar, Searchlight '
        'Pictures, and Blue Sky Studios banners; develops, produces, and licenses live entertainment events; produces '
        'and distributes music; and provides post-production services through Industrial Light & Magic and Skywalker Sound. '
        'Its Direct-To-Consumer & International segment operates international television networks and channels '
        'comprising Disney, ESPN, Fox, National Geographic, and Star; direct-to-consumer videos streaming services '
        'consisting of Disney+, Disney+Hotstar, ESPN+, and Hulu; and operates branded apps and Websites, such as Disney '
        'Movie Club and Disney Digital Network, as well as provides streaming technology support services. The company was '
        'founded in 1923 and is based in Burbank, California." ';
    return Column(
      children: [
        const SizedBox(height: 16),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: 9,
              bottom: 4,
              top: 10,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                "About",
                style: Styles.detailsTitleText(themeData),
              ),
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: SizedBox(
                          height: 25,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Location:',
                              style: Styles.detailsServingLabelText(themeData),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          stock.exchangeName ?? '',
                          textAlign: TextAlign.end,
                          style: themeData.textTheme.textStyle,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: SizedBox(
                          height: 25,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Full Name:',
                              style: Styles.detailsServingLabelText(themeData),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          stock.longName,
                          style: themeData.textTheme.textStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: SizedBox(
                          height: 25,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Ticker:',
                              style: Styles.detailsServingLabelText(themeData),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          stock.symbol,
                          style: themeData.textTheme.textStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    longStory,
                    style: themeData.textTheme.textStyle,
                  )
                  // FutureBuilder(
                  //   future: prefs.desiredCalories,
                  //   builder: (context, snapshot) {
                  //     return Text(
                  //       'Percent daily values based on a diet of '
                  //       '${snapshot?.data ?? '2,000'} calories.',
                  //       style: Styles.detailsServingNoteText(themeData),
                  //     );
                  //   },
                  // ),
                  ),
            ],
          ),
        )
      ],
    );
  }
}

class InfoView extends StatelessWidget {
  final int id;

  const InfoView(this.id);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final prefs = Provider.of<Preferences>(context);
    final stock = appState.getStock(id);
    final themeData = CupertinoTheme.of(context);
    var dateString = DateFormat('MMMM y').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(dateString),
              const Spacer(),
              Text(
                'ID: ${stock.id}',
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            stock.displayName,
            style: Styles.detailsTitleText(themeData),
          ),
          const SizedBox(height: 8),
          Text(
            stock.longName,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          StockInfoChart(stock, prefs),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoSwitch(
                value: stock.isFavorite,
                onChanged: (value) {
                  appState.setFavorite(id, value);
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Save to Stock',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.id, this.restorationId})
      : super(key: key);

  final int id;
  final String? restorationId;

  static String show(NavigatorState navigator, int stockId) {
    return navigator.restorablePush<void>(_routeBuilder, arguments: stockId);
  }

  static Route<void> _routeBuilder(BuildContext context, Object? arguments) {
    final stockId = arguments as int;
    return CupertinoPageRoute(
      builder: (context) =>
          DetailsScreen(id: stockId, restorationId: 'details'),
      fullscreenDialog: true,
    );
  }

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with RestorationMixin {
  final RestorableInt _selectedViewIndex = RestorableInt(0);

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedViewIndex, 'tab');
  }

  @override
  void dispose() {
    _selectedViewIndex.dispose();
    super.dispose();
  }

  Widget _buildHeader(BuildContext context, AppState model) {
    final stock = model.getStock(widget.id);

    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(
              (stock.image != '') ? stock.image : 'assets/images/default.jpg',
              fit: BoxFit.fitHeight,
              semanticLabel: 'A background image of ${stock.displayName}',
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: CloseButton(() {
                Navigator.of(context).pop();
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return UnmanagedRestorationScope(
      bucket: bucket,
      child: CupertinoPageScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                restorationId: 'list',
                children: [
                  _buildHeader(context, appState),
                  const SizedBox(height: 20),
                  CupertinoSegmentedControl<int>(
                    children: const {
                      0: Text(
                        'Facts & Info',
                      ),
                      1: Text(
                        'My position',
                      )
                    },
                    groupValue: _selectedViewIndex.value,
                    onValueChanged: (value) {
                      setState(() => _selectedViewIndex.value = value);
                    },
                  ),
                  _selectedViewIndex.value == 0
                      ? InfoView(widget.id)
                      : const Center(child: Text('My position view')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
