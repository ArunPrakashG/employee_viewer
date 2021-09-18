import '../../../models/serializable_base.dart';
import '../../employee_api/employee.dart';

class EmployeeContainer implements ISerializable<EmployeeContainer> {
  EmployeeContainer({required this.employees});

  final List<Employee> employees;

  @override
  EmployeeContainer fromJson(Map<String, dynamic> json) {
    return EmployeeContainer(employees: (json['employees'] as Iterable<dynamic>).map((e) => Employee.fromMap(e)).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'employees': employees.map((e) => e.toJson()).toList(),
    };
  }
}
