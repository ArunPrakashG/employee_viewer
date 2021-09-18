import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../services/employee_api/employee.dart';
import '../home/home.dart';

class EmployeeUI extends StatelessWidget {
  const EmployeeUI({Key? key, required this.employee}) : super(key: key);

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name ?? 'Unknown Name'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(employee.profileImage ?? defaultAvatar, scale: 1),
                radius: 100,
              ),
              Text(
                employee.name ?? 'Unknown Employee',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              Visibility(
                visible: employee.website != null,
                child: Text(
                  employee.website ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Visibility(
                visible: employee.company?.name != null,
                child: Text(
                  employee.company?.name ?? 'NA',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Visibility(
                visible: employee.company?.bs != null,
                child: Text(
                  employee.company?.bs ?? 'NA',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Visibility(
                visible: employee.company?.catchPhrase != null,
                child: Text(
                  '" ${employee.company?.catchPhrase} "',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Visibility(
                visible: employee.username != null,
                child: ListTile(
                  subtitle: Text(employee.username ?? ''),
                  title: const Text('Username'),
                  leading: const Icon(
                    Icons.supervised_user_circle,
                    size: 40,
                  ),
                ),
              ),
              Visibility(
                visible: employee.email != null,
                child: ListTile(
                  subtitle: Text(employee.email ?? ''),
                  title: const Text('Email'),
                  leading: const Icon(
                    Icons.email,
                    size: 40,
                  ),
                ),
              ),
              Visibility(
                visible: employee.phone != null,
                child: ListTile(
                  subtitle: Text(employee.phone ?? ''),
                  title: const Text('Phone'),
                  leading: const Icon(
                    Icons.phone,
                    size: 40,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 15,
                indent: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
                padding: const EdgeInsets.all(5),
                child: Text(
                  '${employee.address?.city}, ${employee.address?.suite}, ${employee.address?.street}, ${employee.address?.zipcode}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                padding: const EdgeInsets.all(5),
                child: Text(
                  '${employee.address?.geo?.lat} : ${employee.address?.geo?.lng}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
