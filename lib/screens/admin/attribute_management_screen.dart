import 'package:flutter/material.dart';
import 'package:test_app/widgets/admin/equipment_management_tab.dart';
import 'package:test_app/widgets/admin/exercise_modifier_management_tab.dart';
import 'package:test_app/widgets/admin/movement_pattern_management_tab.dart';
import 'package:test_app/widgets/admin/muscle_group_management_tab.dart';

class AttributeManagementScreen extends StatefulWidget {
  const AttributeManagementScreen({super.key});

  @override
  State<AttributeManagementScreen> createState() => _AttributeManagementScreenState();
}

class _AttributeManagementScreenState extends State<AttributeManagementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attribute Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Equipment'),
            Tab(text: 'Movement'),
            Tab(text: 'Muscles'),
            Tab(text: 'Modifiers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          EquipmentManagementTab(),
          MovementPatternManagementTab(),
          MuscleGroupManagementTab(),
          ExerciseModifierManagementTab(),
        ],
      ),
    );
  }
}