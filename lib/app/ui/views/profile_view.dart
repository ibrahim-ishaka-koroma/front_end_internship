import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _controller = Get.find();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        final user = _controller.user.value;
        if (user == null || user.id.isEmpty) {
          return Center(child: Text('User not found'));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user.name}'),
              SizedBox(height: 8),
              Text('ID: ${user.id}'),
              SizedBox(height: 8),
              Text('Data: ${user.data.toString()}'),
            ],
          ),
        );
      }),
    );
  }
}
