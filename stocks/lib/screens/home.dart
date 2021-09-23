import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:stocks/screens/list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: CupertinoTabScaffold(
        restorationId: 'scaffold',
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chart_bar_square)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
          ],
        ),
        tabBuilder: (context, index) {
          late final CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = CupertinoTabView(
                builder: (context) {
                  return const ListScreen(restorationId: 'list');
                },
              );
              break;
            case 1:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('Performance'),
                  ),
                  child: Center(
                    child: CupertinoButton(
                      child: Text(
                        'This is tab #$index',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle
                            .copyWith(fontSize: 32),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) {
                            return DetailScreen(
                                index == 0 ? 'Article' : 'Views');
                          }),
                        );
                      },
                    ),
                  ),
                );
              });
              break;
            case 2:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('Search'),
                  ),
                  child: Center(
                    child: CupertinoButton(
                      child: Text(
                        'This is tab #$index',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle
                            .copyWith(fontSize: 32),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) {
                            return DetailScreen(
                                index == 0 ? 'Article' : 'Views');
                          }),
                        );
                      },
                    ),
                  ),
                );
              });
              break;
            case 3:
              returnValue = CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('Settings'),
                  ),
                  child: Center(
                    child: CupertinoButton(
                      child: Text(
                        'This is tab #$index',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle
                            .copyWith(fontSize: 32),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) {
                            return DetailScreen(
                                index == 0 ? 'Article' : 'Views');
                          }),
                        );
                      },
                    ),
                  ),
                );
              });
              break;
          }
          return returnValue;
        },
      ),
    );
  }
}

// ignore: todo
// TODO: Refactor and delete code after this one
class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic, {Key? key}) : super(key: key);

  final String topic;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  child: const Text("Launch action sheet"),
                  onPressed: () {
                    showCupertinoModalPopup<int>(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            title: const Text("some choices!"),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context, 1);
                                },
                                child: const Text('One!'),
                                isDefaultAction: true,
                              ),
                              CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context, 2);
                                  },
                                  child: const Text('Two!')),
                              CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context, 3);
                                  },
                                  child: const Text('Three!')),
                            ],
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
