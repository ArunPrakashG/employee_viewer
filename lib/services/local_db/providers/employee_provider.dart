import '../generic_connector.dart';
import '../models/employee_container.dart';

class EmployeeProvider extends GenericConnector<EmployeeContainer> {
  EmployeeProvider() : super(key: 'employee', defaultInstanceGenerator: () => EmployeeContainer(employees: []));
}
