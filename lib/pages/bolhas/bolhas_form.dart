// Define a custom Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BolhasForm extends StatefulWidget {
  @override
  BolhasFormState createState() {
    return BolhasFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class BolhasFormState extends State<BolhasForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<BolhasFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
      title: "criar",
      home: Scaffold(
        appBar: AppBar(
          title: Text("criar"),
        ),
        body: Form(
            key: _formKey,
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )
        ),
      ),
    );
  }
}
