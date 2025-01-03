import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Map<String, dynamic>>> usersList;

  @override
  void initState() {
    super.initState();
    usersList = apiServices.listUsers(email: 'nikkk@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: usersList,
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
                  title: Text(user['name'] ??
                      'No Name'), // Adjust key as per API response
                  subtitle: Text(user['email'] ?? 'No Email'),
                );
              },
            );
          }
        },
     ),
);
}
}
