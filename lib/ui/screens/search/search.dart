import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/employee_api/employee.dart';
import '../../../shared/widgets/material_text_input.dart';
import '../../controllers/search/search_controller.dart';
import '../home/home.dart';

class SearchUI extends StatelessWidget {
  SearchUI({Key? key, List<Employee?> employees = const []}) : super(key: key) {
    _controller.employees = employees;
  }

  late final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialTextInputWidget(
              icon: Icons.search,
              title: 'Search Employees',
              inputType: TextInputType.text,
              onTextChanged: _controller.onTextChanged,
            ),
            const Divider(thickness: 1, endIndent: 15, indent: 15),
            Obx(() => _buildSearchResult()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResult() {
    return Column(
      children: [
        for (var result in _controller.searchResults) _buildSearchResultItem(result),
      ],
    );
  }

  Widget _buildSearchResultItem(Employee result) {
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
          onTap: () async => _controller.onSearchResultTapped(result),
          child: Column(
            children: [
              ListTile(
                title: Text(result.name ?? 'NA'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(result.profileImage ?? defaultAvatar),
                ),
                subtitle: Text(result.company?.name ?? 'NA'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
