import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../local_db/models/employee_container.dart';
import '../local_db/providers/employee_provider.dart';
import 'employee.dart';

const String _baseUrl = 'http://www.mocky.io/v2/5d565297300000680030a986';

class EmployeeClient {
  late final EmployeeProvider _provider = EmployeeProvider();

  Future<List<Employee?>> getEmployeeDetails({bool useCache = true}) async {
    if (useCache) {
      if (await _provider.exists()) {
        debugPrint('Using cached data');
        return (await _provider.getData())?.employees ?? [];
      }

      debugPrint('Cache failed.');
    }

    final response = await get(Uri.parse(_baseUrl));
    debugPrint('network request send');

    if (response.statusCode != 200) {
      return [];
    }

    List<Employee> employeeParsed = (jsonDecode(response.body) as Iterable<dynamic>).map((e) => Employee.fromMap(e)).toList();

    if (!useCache) {
      return employeeParsed;
    }

    await _provider.setData(EmployeeContainer(employees: employeeParsed));
    return employeeParsed;
  }
}
