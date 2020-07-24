import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.red),
    ));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon"),
      ),
      body: Center(
        child: SecimButon(),
      ),
    );
  }
}

class SecimButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        gitVeVeriGetir(context);
      },
      child: Text("ikinsinden birisini seç"),
    );
  }
}

gitVeVeriGetir(BuildContext context) async {
  final sonuc = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => SecimScreen()));
  print(sonuc);
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("seçiminiz $sonuc")));
}

class SecimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("seçiminiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "Evet");
                },
                child: Text("Evet"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "Hayır");
                },
                child: Text("Hayır"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
