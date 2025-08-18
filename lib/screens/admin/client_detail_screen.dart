import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientDetailScreen extends ConsumerWidget {
  final String userId;
  const ClientDetailScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Client Detail: $userId'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Kalender'),
              Tab(text: 'Logbuch'),
              Tab(text: 'Übersicht'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Kalender for $userId')),
            Center(child: Text('Logbuch for $userId')),
            Center(child: Text('Übersicht for $userId')),
          ],
        ),
      ),
    );
  }
}