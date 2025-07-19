import 'package:flutter/material.dart';
import 'package:machine_test_lilac/presentation/chat.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Users' profile pictures
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                UserAvatar(name: 'Christina'),
                UserAvatar(name: 'Patricia'),
                UserAvatar(name: 'Celestine'),
                UserAvatar(name: 'Celestine'),
                UserAvatar(name: 'Elizabeth'),
              ],
            ),
          ),
          // Search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Chat list
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ChatItem(name: 'Regina Bearden'),
                ChatItem(name: 'Rhonda Rivera'),
                ChatItem(name: 'Mary Gratton'),
                ChatItem(name: 'Annie Medved'),
                ChatItem(name: 'Regina Bearden'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String name;

  UserAvatar({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        radius: 30,
        child: Text(name[0]),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;

  ChatItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text('10:00 AM'),
      title: Text(name),
      leading: CircleAvatar(backgroundColor: Colors.lightBlue,
          ),onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chat()),
                        );
                      },
    );
  }
}
