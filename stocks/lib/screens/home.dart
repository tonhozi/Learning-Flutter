import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book_solid), label: 'Articles'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.eye_solid), label: 'Views'),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: (index == 0)
                      ? const Text('Articles')
                      : const Text('Views'),
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
                          return DetailScreen(index == 0 ? 'Article' : 'Views');
                        }),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
