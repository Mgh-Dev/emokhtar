import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
      id: '1',
      title: 'رسالة جديدة',
      message: 'لديك رسالة جديدة من الدعم الفني',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: 'تذكير بالموعد',
      message: 'موعدك مجدول ليوم غد الساعة 10:00 صباحاً',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationModel(
      id: '3',
      title: 'تحديث الملف الشخصي',
      message: 'تم تحديث معلومات ملفك الشخصي بنجاح',
      date: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
  ];

  String _filter = 'unread';

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = _filter == 'all'
        ? notifications
        : notifications.where((n) => _filter == 'read' ? n.isRead : !n.isRead).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF075E54),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Filter Buttons in Arabic
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _filter == 'unread' 
                          ? const Color(0xFF075E54) 
                          : Colors.grey[300],
                      foregroundColor: _filter == 'unread' 
                          ? Colors.white 
                          : Colors.black,
                    ),
                    onPressed: () => setState(() => _filter = 'unread'),
                    child: const Text('غير المقروءة'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _filter == 'read' 
                          ? const Color(0xFF075E54) 
                          : Colors.grey[300],
                      foregroundColor: _filter == 'read' 
                          ? Colors.white 
                          : Colors.black,
                    ),
                    onPressed: () => setState(() => _filter = 'read'),
                    child: const Text('المقروءة'),
                  ),
                ),
              ],
            ),
          ),
          
          // Notifications List
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotifications.length,
              itemBuilder: (context, index) {
                final notification = filteredNotifications[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      notification.isRead = true;
                    });
                  },
                  leading: !notification.isRead
                      ? const Icon(Icons.circle, color: Colors.red, size: 12)
                      : const SizedBox(width: 12),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: notification.isRead 
                          ? FontWeight.normal 
                          : FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.message),
                      Text(
                        DateFormat('yyyy/MM/dd - hh:mm a', 'ar')
                            .format(notification.date),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}