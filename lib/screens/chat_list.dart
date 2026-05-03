import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';
import 'chat_screen.dart';
import 'add_message.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<Map<String, String>> chatData = [
    {
      "name": "Aakash",
      "message": "Hey, what's up?",
      "time": "10:30 AM",
    },
    {
      "name": "Friend 1",
      "message": "Let's meet tomorrow",
      "time": "9:45 AM",
    },
  ];

  void addChat(Map<String, String> newChat) {
    setState(() {
      chatData.insert(0, newChat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color(0xFF075E54),
    iconTheme: const IconThemeData(color: Colors.white),
    title: const Text(
    'WhatsApp',
    style: TextStyle(color: Colors.white),
    ),
    actions: [
    IconButton(
    icon: const Icon(Icons.search),
    onPressed: () {},
    ),

    PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
    if (value == "settings") {
    print("Open Settings");
    } else if (value == "profile") {
    print("Open Profile");
    } else if (value == "logout") {
    print("Logout");
    }
    },
    itemBuilder: (context) => [
    const PopupMenuItem(
    value: "profile",
    child: Text("Profile"),
    ),
    const PopupMenuItem(
    value: "settings",
    child: Text("Settings"),
    ),
    const PopupMenuItem(
    value: "logout",
    child: Text("Logout"),
    ),
    ],
    ),
    ],
    ),
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final chat = chatData[index];

          return ChatTile(
            name: chat['name']!,
            message: chat['message']!,
            time: chat['time']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(name: chat['name']!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.chat),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMessageScreen()),
          );

          if (result != null) {
            addChat(result);
          }
        },
      ),
    );
  }
}