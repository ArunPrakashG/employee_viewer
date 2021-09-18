import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/employee_api/employee.dart';
import '../../ui/screens/employee/employee.dart';

const String defaultAvatar = 'https://images.squarespace-cdn.com/content/v1/54b7b93ce4b0a3e130d5d232/1519987020970-8IQ7F6Z61LLBCX85A65S/icon.png?format=1000w';

class EmployeeListItemWidget extends StatelessWidget {
  const EmployeeListItemWidget({Key? key, required this.employee}) : super(key: key);

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () async => Get.to<void>(() => EmployeeUI(employee: employee)),
          child: Column(
            children: [
              ListTile(
                title: Text(employee.name ?? 'Unknown Employee'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(employee.profileImage ?? defaultAvatar),
                ),
                subtitle: Text(employee.company?.name ?? 'Unknown Company'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
