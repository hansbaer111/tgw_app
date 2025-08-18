import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TemplateEditorScreen extends ConsumerWidget {
  final String? templateId;
  const TemplateEditorScreen({Key? key, this.templateId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(templateId == null ? 'New Template' : 'Edit Template: $templateId'),
      ),
      body: Center(
        child: Text(templateId == null ? 'New Template Screen' : 'Edit Template Screen for ID: $templateId'),
      ),
    );
  }
}
