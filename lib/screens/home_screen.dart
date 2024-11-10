import 'package:flutter/material.dart';
import 'package:flutter_front/models/user_model.dart';
import 'package:flutter_front/provider/user_provider.dart';
import 'package:flutter_front/screens/adduser.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add User",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Adduser(),
                    ));
              },
              icon: const Icon(
                Icons.add,
                size: 24,
                color: Colors.black54,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<UserProvider>(
            builder: (context, provider, child) {
              if (provider.getAllUsers.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: provider.getAllUsers.length,
                controller: ScrollController(keepScrollOffset: true),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  User user = provider.getAllUsers[index];
                  return ListTile(
                    
                    hoverColor: Colors.black54,
                    style: ListTileStyle.list,
                    leading: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.grey,
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      user.email,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
