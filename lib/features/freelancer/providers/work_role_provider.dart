import 'package:flutter/widgets.dart';

class WorkRoleProvider extends ChangeNotifier {
  final Map<String, bool> _workRoleCategories = {
    "Business Strategy & Analysis": false,
    "Virtual Assistance": false,
    "Creative Media & Design": false,
    "IT Support & Systems": false,
    "Marketing & Growth": false,
    "Technical Writing & Documentation": false,
    "Software & App Development": false,
    "Linguistic Services": false,
    "Legal & Compliance": false,
    "Engineering & Technical Solutions": false,
    "Customer Relations & Support": false,
    "Financial & Audit Services": false,
  };
  Map<String, bool> get categories => _workRoleCategories;
  int get selectedCount => categories.values.where((value) => value).length;

  List<String> get selectedRolesList {
    return categories.keys.where((key) => categories[key] == true).toList();
  }

  toggleCategory(String category, bool newValue) {
    if (newValue == true && selectedCount >= 3) {
      return;
    }
    categories[category] = newValue;
    notifyListeners();
  }
}
