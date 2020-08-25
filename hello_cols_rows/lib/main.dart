import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mate App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  bool _isActive = false;
  bool _isSeen = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
            icon: Icon(
              Icons.done_all,
              color: _isSeen ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isSeen = !_isSeen;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              "Mi primer app",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ingrese texto",
                ),
                maxLength: 12,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    print("Texto:${_textController.text}");
                  },
                  child: Text("Mostrar"),
                  color: Colors.amber[100],
                ),
                MaterialButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  child: Text("Borrar"),
                  color: Colors.deepPurple[100],
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dificil"),
                Switch(
                    value: _isActive,
                    onChanged: (val) {
                      setState(() {
                        _isActive = val;
                      });
                    }),
                Text("Facil"),
              ],
            ),
            Image.network(
              "https://miro.medium.com/max/1000/1*Dkay_GxQmBmumsTUud4bDQ.png",
            ),
          ],
        ),
      ),
    );
  }
}
