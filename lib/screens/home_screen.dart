import 'package:flutter/material.dart';
import 'cards_screen.dart'; // Import the new CardsScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo in the top-left corner
          Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
              ),
            ),
          ),

          // Welcome text aligned to right
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'مرحبا!',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          
          // Flag image below text
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Center(
              child: Image.asset('assets/flag.png', height: 90),
            ),
          ),
          
          // Description text aligned to right
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'هذا التطبيق الالكتروني\nلمختار مار مبحاثيل بنابيل',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),

          // Four equal buttons
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildMenuButton('طلب موعد', Icons.calendar_today),
                _buildMenuButton('تقديم طلب', Icons.edit_document),
                _buildMenuButton('تعرف على المختار', Icons.info_outline),
                _buildMenuButton('استشارات', Icons.chat),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light grey background
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFF075E54)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.credit_card, color: Colors.grey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardsScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(String text, IconData icon) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Color(0xFF4CAF50);
            }
            return Color(0xFF075E54);
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xFF075E54), width: 1),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}