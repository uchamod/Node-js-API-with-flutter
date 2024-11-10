import 'package:flutter/material.dart';
import 'package:flutter_front/models/user_model.dart';
import 'package:flutter_front/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New User",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                //getname
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      label: const Text("Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //get email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //get age
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      label: const Text("Age"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a age';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final newuser = User(
                          id: "",
                          name: _nameController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text));

                      try {
                        await Provider.of<UserProvider>(context, listen: false)
                            .crateUser(newuser);
                        Navigator.pop(context);
                      } catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error adding user: $err')),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Add User",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
