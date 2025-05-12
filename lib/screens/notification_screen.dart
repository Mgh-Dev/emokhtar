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
      title: 'New Message',
      message: 'You have received a new message from support',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: 'Appointment Reminder',
      message: 'Your appointment is scheduled for tomorrow at 10:00 AM',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationModel(
      id: '3',
      title: 'Profile Update',
      message: 'Your profile information has been updated successfully',
      date: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
  ];

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  String _filter = 'unread';

  @override
  Widget build(BuildContext context) {
    final filteredNotifications = _filter == 'all'
        ? notifications
        : notifications.where((n) => _filter == 'read' ? n.isRead : !n.isRead).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFF075E54),
        centerTitle: true,
        title: Text(
          'Notifications (${unreadCount})',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Filter Buttons
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
                    child: const Text('Unread'),
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
                    child: const Text('Read'),
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
                return InkWell(
                  onTap: () {
                    setState(() {
                      notification.isRead = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Red dot for unread notifications
                        if (!notification.isRead)
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          )
                        else
                          const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.title,
                                style: TextStyle(
                                  fontWeight: notification.isRead 
                                      ? FontWeight.normal 
                                      : FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                notification.message,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                DateFormat('MMM dd, yyyy - hh:mm a')
                                    .format(notification.date),
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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