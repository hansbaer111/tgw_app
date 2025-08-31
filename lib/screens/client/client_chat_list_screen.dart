import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/conversation_model.dart';
import 'package:test_app/services/database_service.dart';
import 'package:test_app/screens/client/chat_screen.dart';
import 'package:test_app/providers/providers.dart'; // Central providers file

class ClientChatListScreen extends ConsumerWidget {
  const ClientChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationsAsync = ref.watch(clientConversationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Chats'),
      ),
      body: conversationsAsync.when(
        data: (conversations) {
          if (conversations.isEmpty) {
            return const Center(child: Text('No active chats. Start a new conversation!'));
          }
          return ListView.builder(
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              final conversation = conversations[index];
              // Determine recipient name (admin's name)
              final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
              final recipientId = conversation.participantIds.firstWhere((id) => id != currentUserUid);
              final recipientUserAsync = ref.watch(userProvider(recipientId));

              return recipientUserAsync.when(
                data: (recipientUser) {
                  final recipientName = recipientUser.displayName ?? 'Unknown User';
                  return ListTile(
                    title: Text(recipientName),
                    subtitle: Text(conversation.lastMessage),
                    trailing: Text(
                      '${conversation.lastMessageTimestamp.hour}:${conversation.lastMessageTimestamp.minute}',
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          conversationId: conversation.id,
                          recipientName: recipientName,
                        ),
                      ));
                    },
                  );
                },
                loading: () => ListTile(
                  title: Text(conversation.lastMessage),
                  subtitle: const Text('Loading recipient...'),
                ),
                error: (err, stack) => ListTile(
                  title: Text(conversation.lastMessage),
                  subtitle: const Text('Error loading recipient'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser == null) return; // Should not happen

          // Assuming there's a single admin for now, or a way to identify the admin
          // For simplicity, let's assume admin ID is hardcoded or fetched from somewhere
          // In a real app, you'd fetch the admin's UID from a config or user list
          const adminId = 'YOUR_ADMIN_UID'; // TODO: Replace with actual admin UID

          final conversationId = '${currentUser.uid}_$adminId';

          // Check if conversation already exists
          final conversationDoc = await FirebaseFirestore.instance
              .collection('conversations')
              .doc(conversationId)
              .get();

          if (!conversationDoc.exists) {
            // Create new conversation
            await FirebaseFirestore.instance
                .collection('conversations')
                .doc(conversationId)
                .set({
              'participantIds': [currentUser.uid, adminId],
              'lastMessage': '',
              'lastMessageTimestamp': FieldValue.serverTimestamp(),
              'lastMessageSenderId': '',
              'clientName': currentUser.displayName ?? currentUser.email,
              'adminName': 'Admin', // TODO: Fetch actual admin name
            });
          }

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatScreen(
              conversationId: conversationId,
              recipientName: 'Admin', // TODO: Fetch actual admin name
            ),
          ));
        },
        child: const Icon(Icons.add_comment),
      ),
    );
  }
}