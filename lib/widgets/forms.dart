import 'package:flutter/material.dart';

import 'package:validate/validate.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _LoginData {
  String email = "";
  String password = "";
}

class _FormsState extends State<Forms> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'Invalid Email';
    }
    return value;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 chaarcters';
    }
    return value;
  }

  void submit() {
    if (this._formkey.currentState!.validate()) {
      _formkey.currentState!.save();
    }
  }

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
              decoration:
                  const InputDecoration(hintText: 'Name', labelText: 'Name'),
              controller: _nameController,
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
          ElevatedButton(
            onPressed: submit,
            child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }
}
