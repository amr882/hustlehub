import 'package:flutter/material.dart';
import 'package:hustlehub/features/freelancer/services/rtdb.dart';

class WorkRole extends StatefulWidget {
  const WorkRole({super.key});

  @override
  State<WorkRole> createState() => _WorkRoleState();
}

class _WorkRoleState extends State<WorkRole> {
  testdb() async {
    Rtdb().test();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () => testdb(),
        color: Colors.blue,
        child: Text("data"),
      ),
    );
  }
}
