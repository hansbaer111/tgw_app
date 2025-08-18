import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart'; // Import providers
import 'package:test_app/screens/client/chat_screen.dart'; // Import ChatScreen
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:test_app/models/user_model.dart'; // Import UserModel

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adminConversationsAsyncValue = ref.watch(adminConversationsProvider);
    final allUsersAsyncValue = ref.watch(allUsersProvider); // To get user names for conversations

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ausstehende Freischaltungen',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Keine ausstehenden Freischaltungen.'),
                  // TODO: Add actual data for pending approvals
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistiken',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Gesamtzahl der Klienten: 0'),
                  Text('Aktive Trainingspläne: 0'),
                  // TODO: Add actual statistics
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Ungelesene Nachrichten Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ungelesene Nachrichten',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  adminConversationsAsyncValue.when(
                    data: (conversations) {
                      if (conversations.isEmpty) {
                        return const Text('Keine ungelesenen Nachrichten.');
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: conversations.length,
                        itemBuilder: (context, index) {
                          final conversation = conversations[index];
                          // Determine the other participant's UID
                          final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
                          final otherParticipantId = conversation.participantIds.firstWhere(
                            (id) => id != currentUserUid,
                            orElse: () => '', // Should not happen in a 2-person chat
                          );

                          // Get the other participant's name
                          final otherParticipantName = allUsersAsyncValue.when(
                            data: (users) {
                              final otherUser = users.firstWhere(
                                (user) => user.uid == otherParticipantId,
                                orElse: () => UserModel(uid: '', email: '', displayName: 'Unknown User', role: 'client', status: 'approved'), // Provide a default UserModel
                              );
                              return otherUser.displayName;
                            },
                            loading: () => 'Loading...',
                            error: (error, stack) => 'Error',
                          );

                          return ListTile(
                            title: Text('Chat with $otherParticipantName'),
                            subtitle: Text(conversation.lastMessage),
                            trailing: conversation.unreadCount > 0
                                ? CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      conversation.unreadCount.toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                : null,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    conversationId: conversation.id,
                                    recipientName: otherParticipantName,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Center(child: Text('Error loading conversations: $error')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}