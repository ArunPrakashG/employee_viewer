import 'package:employee_viewer/services/employee_api/employee.dart';

import '../generic_connector.dart';

class EmployeeProvider extends GenericConnector<Employee> {
  EmployeeProvider() : super(key: 'employee', defaultInstanceGenerator: () => Employee());
}
