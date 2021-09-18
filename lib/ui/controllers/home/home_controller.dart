import 'package:get/get.dart';

import '../../../services/employee_api/employee.dart';
import '../../../services/employee_api/employee_client.dart';
import '../../screens/employee/employee.dart';
import '../../screens/search/search.dart';

class HomeController extends GetxController {
  late final EmployeeClient _client = EmployeeClient();

  Future<List<Employee?>> getEmployees() async {
    return await _client.getEmployeeDetails();
  }

  Future<void> onEmployeeTapped(Employee employee) async => Get.to<void>(
        () => EmployeeUI(
          employee: employee,
        ),
      );

  Future<void> onSearchTapped() async {
    final employees = await getEmployees();
    Get.to<void>(() => SearchUI(employees: employees));
  }
}
