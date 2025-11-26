import 'package:flutter/material.dart';
import 'package:hustlehub/features/freelancer/providers/work_role_provider.dart';
import 'package:provider/provider.dart';

int selectedRoleCount = 0;

class WorkRole extends StatefulWidget {
  const WorkRole({super.key});

  @override
  State<WorkRole> createState() => _WorkRoleState();
}

class _WorkRoleState extends State<WorkRole> {
  @override
  Widget build(BuildContext context) {
    final workRoleProvider = Provider.of<WorkRoleProvider>(context);
    final categoryNames = workRoleProvider.categories.keys.toList();
    return ListView.builder(
      itemCount: categoryNames.length,
      itemBuilder: (context, index) {
        final String categoryName = categoryNames[index];
        final bool isChecked =
            workRoleProvider.categories[categoryName] ?? false;
        return CheckboxListTile(
          activeColor: Colors.lightGreen,
          title: Text(categoryName),
          value: isChecked,
          onChanged: (val) {
            final int currentCount = workRoleProvider.selectedCount;
            if (val == true && currentCount >= 3) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("You can choose only 3")),
              );
              return;
            }
            workRoleProvider.toggleCategory(categoryName, val!);
          },
        );
      },
    );
  }
}
