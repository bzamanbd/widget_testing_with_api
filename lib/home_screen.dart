import 'package:flutter/material.dart';
import 'package:widget_test_with_api/user_model_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final futureUsers = UserModelRepository().fetchUsers;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureUsers,
        builder: (_, snapshort) {
          if (snapshort.hasData) {
            final users = snapshort.data!;
            return ListView.builder(
              itemBuilder: (_, index) {
                final user = users[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(user.name.toString()),
                    subtitle: Text(user.email.toString()),
                  ),
                );
              },
              itemCount: users.length,
            );
          } else if (snapshort.hasError) {
            return const Center(child: Text('some error occurred'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
