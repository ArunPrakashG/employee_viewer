import 'package:flutter/material.dart';

import '../../../services/employee_api/employee.dart';
import '../../controllers/home/home_controller.dart';

const String defaultAvatar = 'https://images.squarespace-cdn.com/content/v1/54b7b93ce4b0a3e130d5d232/1519987020970-8IQ7F6Z61LLBCX85A65S/icon.png?format=1000w';

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
      body: FutureBuilder<List<Employee?>>(
        future: _controller.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // TODO: add empty array/null check in case api fails

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final employee = snapshot.data![index];

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
                    onTap: () async => _controller.onEmployeeTapped(employee!),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(employee!.name ?? 'NA'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(employee.profileImage ?? defaultAvatar),
                          ),
                          subtitle: Text(employee.company?.name ?? 'NA'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
