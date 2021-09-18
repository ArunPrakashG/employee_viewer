import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/custom_error_widget.dart';
import '../../../shared/widgets/employee_list_item.dart';
import '../../controllers/home/home_controller.dart';

class HomeUI extends StatelessWidget {
  HomeUI({Key? key}) : super(key: key);

  late final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Viewer'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _controller.onSearchTapped,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<bool>(
        future: _controller.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.data!) {
            return CustomErrorWidget(
              refresh: _controller.getEmployees,
            );
          }

          return Obx(
            () => ListView.builder(
              itemCount: _controller.employees.length,
              itemBuilder: (context, index) {
                final employee = _controller.employees[index];

                if (employee == null) {
                  return const SizedBox.shrink();
                }

                return EmployeeListItemWidget(employee: employee);
              },
            ),
          );
        },
      ),
    );
  }
}
