import 'package:flutter/material.dart';
import 'home.dart'; // Import halaman home

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _school = '';
  String _about = '';
  String _history = '';
  String _skills = '';
  String? _imagePath;

  // Input decoration helper function
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input for Name
                TextFormField(
                  decoration: _inputDecoration('Name'),
                  onSaved: (value) {
                    _name = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Input for School
                TextFormField(
                  decoration: _inputDecoration('School'),
                  onSaved: (value) {
                    _school = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your school name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Input for About
                TextFormField(
                  decoration: _inputDecoration('About'),
                  onSaved: (value) {
                    _about = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide some information about yourself';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Input for History
                TextFormField(
                  decoration: _inputDecoration('History'),
                  onSaved: (value) {
                    _history = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your history';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Input for Skills
                TextFormField(
                  decoration: _inputDecoration('Skills'),
                  onSaved: (value) {
                    _skills = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please list your skills';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 24),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                              name: _name,
                              school: _school,
                              about: _about,
                              history: _history,
                              skills: _skills,
                              imagePath: _imagePath,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 50.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
