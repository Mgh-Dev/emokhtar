import 'package:flutter/material.dart';
import 'manager_documents_screen.dart';
import 'manager_appointments_screen.dart';
import 'manager_wallet_screen.dart';
import 'manager_requests_screen.dart';
import '../user_profile_screen.dart'; // Changed from manager_profile_screen
import '../notification_screen.dart';

class ManagerHomeScreen extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/logo.png', width: 120, height: 120),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'مرحباً',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: Center(child: Image.asset('assets/flag.png', height: 90)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'هذا التطبيق الالكتروني\nلمختار مار ميخائيل بنابيل',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildMenuButton(context, 'الطلبات', Icons.list_alt),
                _buildMenuButton(context, 'المواعيد', Icons.calendar_today),
                _buildMenuButton(context, 'المستندات', Icons.description),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
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
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home, color: Color(0xFF075E54)),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.credit_card, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManagerWalletScreen()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                  );
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfileScreen()), // Now using user profile
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF128C7E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (text == 'الطلبات') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerRequestsScreen()));
        } else if (text == 'المواعيد') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerAppointmentsScreen()));
        } else if (text == 'المستندات') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerDocumentsScreen()));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}