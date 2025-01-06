import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: GetBuilder<UsersController>(
        init: UsersController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: controller.fetchUsers,
                  child: const Text('Fetch Users'),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: controller.usersList == null
                      ? const Center(
                          child: Text('Enter an email and press Fetch Users.'),
                        )
                      : FutureBuilder<List<Map<String, dynamic>>>(
                          future: controller.usersList,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(child: Text('No users found.'));
                            } else {
                              final users = snapshot.data!;
                              return ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  final user = users[index];
                                  return ListTile(
                                    title: Text(user['name'] ?? 'No Name'),
                                    subtitle: Text(user['email'] ?? 'No Email'),
                                  );
                                },
                              );
                            }
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UsersController extends GetxController {
  final ApiServices apiServices = ApiServices();
  final TextEditingController emailController = TextEditingController();
  Future<List<Map<String, dynamic>>>? usersList;

  void fetchUsers() {
    final email = emailController.text.trim();
    if (email.isNotEmpty) {
      usersList = apiServices.listUsers(email: email);
      update();
    } else {
      Get.snackbar('Error', 'Please enter a valid email address.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
