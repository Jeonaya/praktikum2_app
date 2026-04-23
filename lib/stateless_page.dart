import 'package:flutter/material.dart';
import 'main.dart';

class StatelessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FB),

      appBar: AppBar(
        title: Text("Stateless Page"),
        backgroundColor: Color.fromARGB(255, 173, 185, 212),
      ),

      drawer: buildDrawer(context, null, "stateless"),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // 🔥 HEADER
            Text(
              "Apa itu Stateless Widget?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Stateless Widget adalah widget yang tidak memiliki state atau kondisi yang dapat berubah selama aplikasi berjalan. "
              "Artinya, tampilan yang ditampilkan akan selalu sama dan tidak akan berubah kecuali dilakukan rebuild dari luar.",
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 20),

            // 📦 CARD PENJELASAN
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.info, color: Color(0xFF4A6CF7)),
                title: Text("Ciri-ciri Stateless"),
                subtitle: Text(
                  "• Tidak memiliki state\n"
                  "• Tidak berubah saat runtime\n"
                  "• Lebih ringan dan sederhana",
                ),
              ),
            ),

            SizedBox(height: 10),

            // 📦 CARD CONTOH
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.code, color: Colors.green),
                title: Text("Contoh Penggunaan"),
                subtitle: Text(
                  "Biasanya digunakan untuk tampilan statis seperti teks, icon, atau halaman informasi.",
                ),
              ),
            ),

            SizedBox(height: 20),

            // 💡 NOTE
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFE3E8FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Kesimpulan: Stateless Widget hanya menampilkan UI tanpa perubahan data.",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}