import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../widgets/chat_message.dart';
import '../widgets/new_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    // here send notification all persoin which is on chat
    fcm.subscribeToTopic('chat');
    // here you pick a token and send a notification befafe of token 
  // final token = await fcm.getToken();
   //print("=--22--- $token");// you could send this token (via Http or the Firebase SDK)TO A BACKED
  }

  @override
  void initState() {
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
// import 'package:chat_application/widgets/chat_message.dart';
// import 'package:chat_application/widgets/new_messages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("FlutterChat"),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                 },
//                 icon: Icon(Icons.exit_to_app,
//                     color: Theme.of(context).colorScheme.primary))
//           ],
//         ),
//         body: Column(
//           children: const [Expanded(child: ChatMessages()), NewMessage()],
//         ));
//   }
// }
