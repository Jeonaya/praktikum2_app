import 'package:flutter/material.dart';
import 'main.dart';

class StatefulPage extends StatefulWidget {
  final Function(String) onAddFavorite;

  StatefulPage({required this.onAddFavorite});

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  int counter = 0;

  void increment() => setState(() => counter++);
  void decrement() => setState(() => counter--);

  void addToFavorite() {
    widget.onAddFavorite("Counter: $counter");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Ditambahkan ke favorite")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      appBar: AppBar(
        title: Text("Stateful Page"),
        backgroundColor: Color(0xFFE0E0E0),
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      drawer: buildDrawer(context, widget.onAddFavorite, "stateful"),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // 🔥 DESKRIPSI
            Text(
              "Apa itu Stateful Widget?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Stateful Widget adalah widget yang memiliki state (data) yang dapat berubah selama aplikasi berjalan. "
              "Perubahan tersebut akan memperbarui tampilan UI menggunakan setState(). "
              "Widget ini biasanya digunakan untuk fitur interaktif seperti counter, form, atau tombol.",
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 20),

            // 📦 CARD COUNTER
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Counter",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    Text(
                      "$counter",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: decrement,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[400],
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Icon(Icons.remove, color: Colors.black),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: increment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // ❤️ FAVORITE BUTTON
            ElevatedButton.icon(
              onPressed: addToFavorite,
              icon: Icon(Icons.favorite),
              label: Text("Tambah ke Favorite"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}