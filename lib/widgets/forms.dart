import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form '),
      ),
      body: Form(
        key: _formkey,
        child: ListView(children: <Widget>[
          Card(
            child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Name',
                // labelText: 'Name'
              ),
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Valid Text';
                }
                return value;
              },
            ),
          ),
          Card(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
              controller: _ageController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Valid Text';
                }
                return value;
              },
            ),
          ),
          Card(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'E-mail Address',
              ),
              controller: _classController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Valid Text';
                }
                return value;
              },
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Submit'))
        ]),
      ),
    );
  }
}
