import 'package:flutter/material.dart';

class ManagerAppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جدول المواعيد'),
        backgroundColor: Color(0xFF075E54),
      ),
      body: Center(child: Text('إدارة المواعيد هنا')),
    );
  }
}