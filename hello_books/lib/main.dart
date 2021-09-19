import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BooksApp',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Books App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> greetings = [
    'Hello Books',
    'Olá Livros',
    'Ciao Libri',
    'Hallo Bücher',
  ];

  int index = 0;
  late String current;
  void _updateGreeting() {
    setState(() {
      current = greetings[index];
      index = index == (greetings.length - 1) ? 0 : index + 1;
    });
  }

  bool isLocal = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              children: const [
                Icon(Icons.airplanemode_off),
                Icon(Icons.airplanemode_on),
                ],
              isSelected: [!isLocal, isLocal],
              onPressed: (int index) {
                setState(() {
                  isLocal = !isLocal;
                });
              },
            ),
            Text(
              greetings[index],
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              width: 300 * 1.1,
              height: 500 * 1.1,
              padding: const EdgeInsets.all(20.0),
              child: isLocal ? loadLocalImage():loadInternetImage(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateGreeting,
        tooltip: 'Greeting',
        child: const Icon(Icons.insert_emoticon),
      ), 
    );
  }

  Widget loadLocalImage() {
    return Image.asset("assets/book_cover.jpg");
  }

  Widget loadInternetImage() {
    return Image.network("https://m.media-amazon.com/images/I/51zSz5E2vAL.jpg");
  }
}
