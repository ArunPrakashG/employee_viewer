import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../local_db/providers/employee_provider.dart';
import 'employee.dart';

const String _baseUrl = 'http://www.mocky.io/v2/5d565297300000680030a986';

class EmployeeClient {
  late final EmployeeProvider _provider = EmployeeProvider();

  Future<Employee?> getEmployeeDetails({bool useCache = true}) async {
    if (useCache) {
      if (await _provider.exists()) {
        return await _provider.getData();
      }

      debugPrint('Cache failed.');
    }

    final response = await get(Uri.parse(_baseUrl));

    if (response.statusCode != 200) {
      return null;
    }

    Employee employeeParsed = Employee.fromJson(response.body);

    if (!useCache) {
      return employeeParsed;
    }

    await _provider.setData(employeeParsed);
  }
}
