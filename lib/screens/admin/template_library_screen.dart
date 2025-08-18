import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/screens/admin/template_editor_screen.dart';
import 'package:test_app/providers/providers.dart'; // Import providers

class TemplateLibraryScreen extends ConsumerWidget {
  const TemplateLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Library'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Template A'),
            subtitle: const Text('Full Body Workout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TemplateEditorScreen(templateId: 'template_a_id'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Template B'),
            subtitle: const Text('Upper/Lower Split'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TemplateEditorScreen(templateId: 'template_b_id'),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TemplateEditorScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
