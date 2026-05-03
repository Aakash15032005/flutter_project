import 'package:flutter/material.dart';

class AddMessageScreen extends StatefulWidget {
  const AddMessageScreen({super.key});

  @override
  State<AddMessageScreen> createState() => _AddMessageScreenState();
}

class _AddMessageScreenState extends State<AddMessageScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void save() {
    if (nameController.text.isEmpty || messageController.text.isEmpty) return;

    Navigator.pop(context, {
      "name": nameController.text,
      "message": messageController.text,
      "time": "Now",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Chat"),
        backgroundColor: const Color(0xFF075E54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: save,
              child: const Text("SAVE"),
            )
          ],
        ),
      ),
    );
  }
}