import 'package:get/get.dart';

import '../../../services/employee_api/employee.dart';
import '../../../services/employee_api/employee_client.dart';
import '../../screens/search/search.dart';

class HomeController extends GetxController {
  late final EmployeeClient _client = EmployeeClient();

  late RxList<Employee?> employees = <Employee?>[].obs;

  Future<bool> getEmployees() async {
    try {
      employees.value = await _client.getEmployeeDetails();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> onSearchTapped() async {
    Get.to<void>(() => SearchUI(employees: employees));
  }
}
