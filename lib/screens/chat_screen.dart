import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ChatScreen extends StatefulWidget {
  final String name;

  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> messages = [];

  void sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      messages.add(ChatMessage(text: _controller.text, isMe: true));
    });

    _controller.clear();
  }

  @override
  void initState() {
    super.initState();

    messages.addAll([
      ChatMessage(text: "Hi 👋", isMe: false),
      ChatMessage(text: "Hello", isMe: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),

        // PROFILE ICON (LEFT SIDE)
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),

        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: messages[index].text,
                    isMe: messages[index].isMe,
                  );
                },
              ),
            ),
            MessageInputField(
              controller: _controller,
              onSend: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}