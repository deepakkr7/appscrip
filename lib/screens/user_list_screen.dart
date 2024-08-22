import 'package:appscrip/screens/user_detail_screen.dart';
import 'package:appscrip/widget/user_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';


class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UserProvider>().fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('User List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
               decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                labelText: 'Search users',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => context.read<UserProvider>().searchUsers(value),
            ),
          ),
           Expanded(
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  if (userProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (userProvider.error.isNotEmpty) {
                    return Center(child: Text(userProvider.error));
                  } else {
                    return RefreshIndicator(
                      onRefresh: () => userProvider.fetchUsers(),
                      child: ListView.builder(
                        itemCount: userProvider.users.length,
                        itemBuilder: (context, index) {
                          final user = userProvider.users[index];
                          return UserListItem(
                            user: user,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailScreen(user: user),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
