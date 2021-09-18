import 'package:get/get.dart';

import '../../../services/employee_api/employee.dart';
import '../../screens/employee/employee.dart';

class SearchController extends GetxController {
  late List<Employee?> employees = [];

  late RxList searchResults = [].obs;

  Future<void> onSearchResultTapped(Employee employee) async => Get.to<void>(
        () => EmployeeUI(
          employee: employee,
        ),
      );

  void onTextChanged(String? newText) async {
    if (isNullOrEmpty(newText) || newText!.length <= 2) {
      return;
    }

    searchResults.value = employees.where((element) => _isEqual(element?.name, newText) || _isEqual(element?.email, newText)).toList();
  }

  bool _isEqual(String? a, String? b) {
    if (isNullOrEmpty(a) || isNullOrEmpty(b)) {
      return false;
    }

    if (a!.toLowerCase().contains(b!.toLowerCase())) {
      return true;
    }

    return false;
  }
}

bool isNullOrEmpty(String? text) => text == null || text.isEmpty;
