import 'package:flutter/material.dart';
import 'stateless_page.dart';
import 'stateful_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum 2',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5), // abu soft
      ),
      home: HomePage(),
    );
  }
}

// 🔥 DRAWER DENGAN HIGHLIGHT ABU
Widget buildDrawer(
  BuildContext context,
  Function(String)? addFavorite,
  String currentPage,
) {
  Widget buildItem(
      String title, IconData icon, String pageKey, Function() onTap) {
    bool isActive = currentPage == pageKey;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFE0E0E0) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? Colors.black : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey[700],
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  return Drawer(
    child: Container(
      color: Color(0xFFF5F5F5),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("A", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                Text("Arjuna",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                Text("Flutter Developer",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          buildItem("Home", Icons.home, "home", () {
            Navigator.popUntil(context, (route) => route.isFirst);
          }),

          buildItem("Stateless", Icons.layers, "stateless", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => StatelessPage()),
            );
          }),

          buildItem("Stateful", Icons.touch_app, "stateful", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    StatefulPage(onAddFavorite: addFavorite ?? (_) {}),
              ),
            );
          }),
        ],
      ),
    ),
  );
}

// ================= HOME =================
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> favorites = [];

  void addFavorite(String item) {
    setState(() {
      if (!favorites.contains(item)) {
        favorites.add(item);
      }
    });
  }

  Widget buildMenu(BuildContext context, String title, String subtitle,
      IconData icon, Widget page) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Arjuna 👋"),
        backgroundColor: Color(0xFFE0E0E0), // abu
        elevation: 1,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      drawer: buildDrawer(context, addFavorite, "home"),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // PROFILE
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("A", style: TextStyle(color: Colors.white)),
                ),
                title: Text("Arjuna",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Flutter Developer"),
              ),
            ),

            SizedBox(height: 20),

            // FAVORITE
            if (favorites.isNotEmpty) ...[
              Text("⭐ Favorite",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          favorites[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],

            buildMenu(context, "Stateless Page", "UI statis", Icons.layers,
                StatelessPage()),

            buildMenu(context, "Stateful Page", "UI interaktif",
                Icons.touch_app,
                StatefulPage(onAddFavorite: addFavorite)),
          ],
        ),
      ),
    );
  }
}