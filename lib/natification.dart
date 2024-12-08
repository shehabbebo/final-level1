import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Clear All Notifications"),
                    content: Text(
                        "Are you sure you want to clear all notifications?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Clear"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Clear all',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          buildNotificationItem(
            icon: Icons.settings,
            title:
                'We know that—for children AND adults—learning is most effective when it is',
            date: 'Aug 12, 2020 at 12:08 PM',
            isNew: true,
          ),
          buildNotificationItem(
            icon: Icons.calendar_today,
            title:
                'The future of professional learning is immersive, communal experiences for',
            date: 'Aug 12, 2020 at 12:08 PM',
          ),
          buildNotificationItem(
            icon: Icons.notifications,
            title:
                'With this in mind, Global Online Academy created the Blended Learning Design',
            date: 'Aug 12, 2020 at 12:08 PM',
          ),
          buildNotificationItem(
            icon: Icons.notifications,
            title:
                'Technology should serve, not drive, pedagogy. Schools often discuss',
            date: 'Aug 12, 2020 at 12:08 PM',
          ),
          buildNotificationItem(
            icon: Icons.notifications,
            title:
                'Peer learning works. By building robust personal learning communities both',
            date: 'Aug 12, 2020 at 12:08 PM',
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationItem({
    required IconData icon,
    required String title,
    required String date,
    bool isNew = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 28,
              ),
              if (isNew)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
            ],
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            date,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Divider(),
      ],
    );
  }
}
