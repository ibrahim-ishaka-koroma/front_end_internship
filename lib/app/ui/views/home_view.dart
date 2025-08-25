// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller;

  HomeView({Key? key}) : _controller = Get.find(), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (_controller.users.isEmpty) {
          return Center(child: Text('No data available'));
        }
        return ListView.builder(
          itemCount: _controller.users.length,
          itemBuilder: (context, index) {
            final user = _controller.users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.id),
              onTap: () {}, // Navigate to detail/profile view
            );
          },
        );
      }),
    );
  }
}
