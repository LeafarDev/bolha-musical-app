// Define a custom Form widget.
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DeviceForm extends StatefulWidget {
  @override
  DeviceFormState createState() {
    return DeviceFormState();
  }
}

class DeviceFormState extends State<DeviceForm> {
  String _value;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return AlertDialog(
            title: Text('Selecione um Dispositivo'),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _gerarListaDevicesDropdown(state.devices),
                    onChanged: (String value) async {
                      setState(() {
                        _value = value;
                      });
                      Navigator.of(context).pop();
                      await UsersApi.updateDevice(value);
                      await UsersApi.devices();

                    },
                    value: _value,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<DropdownMenuItem<String>> _gerarListaDevicesDropdown(
      List<Device> devices) {
    List<DropdownMenuItem<String>> lista = [];
    if (devices.isNotEmpty) {
      for (var i = 0; i < devices.length; i++) {
        if (devices[i].isActive) {
          _value = devices[i].id;
        }

        lista.add(DropdownMenuItem<String>(
          key: UniqueKey(),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.body1,
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Icon(devices[i].getIcon()),
                  ),
                ),
                TextSpan(text: devices[i].name),
              ],
            ),
          ),
          value: devices[i].id,
        ));
      }
    } else {
      _value = null;
    }

    return lista;
  }
}
