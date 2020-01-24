// Define a custom Form widget.
import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class BolhasForm extends StatefulWidget {
  @override
  BolhasFormState createState() {
    return BolhasFormState();
  }
}

class BolhasFormState extends State<BolhasForm> {
  TextEditingController _textFieldController = TextEditingController();
  ColorSwatch _tempMainColor;
  Color _tempShadeColor;
  ColorSwatch _mainColor = Colors.blue;
  Color _shadeColor = Colors.blue[800];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return AlertDialog(
      backgroundColor: Color.fromRGBO(1, 41, 51, 1),
      title: Text('Adicionar Bolha', style: TextStyle(color: Colors.white),),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.40,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Apelido da Bolha",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                height: MediaQuery.of(context).size.height * 0.06,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textFieldController,
                        onChanged: (value) {

                        },
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Ex: Galera do Rap ZL',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cor da Bolha",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                child: MaterialColorPicker(
                  selectedColor: _shadeColor,
                  onColorChange: (color) {
                    print(color.value);
                    setState(() => _shadeColor = color);
                  },
                  onMainColorChange: (color) => setState(() => _tempMainColor = color),
                  onBack: () => print("Back button pressed"),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Criar'),
          onPressed: () {
            BolhaApi.criarBolha(_textFieldController.value.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
