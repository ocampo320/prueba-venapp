import 'package:flutter/material.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:kncha_app/feautures/home/application/bloc/save_bloc/save_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/save_bloc/save_state.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/dropdown_custom.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/textField_widget.dart';

import '../../../../core/styles/styles.dart';
import '../../application/bloc/save_bloc/save_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SavePage extends StatelessWidget {
  const SavePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agendar Cancha'),
      ),
      body: SaveForm(),
    );
  }
}

class SaveForm extends StatefulWidget {
  @override
  _SaveFormState createState() => _SaveFormState();
}

class _SaveFormState extends State<SaveForm> {
  final _formKey = GlobalKey<FormState>();
 List courts = ["Cancha grande", "Cancha media", "Cancha peque"];
    TextEditingController dateInput = TextEditingController(text: '');
    TextEditingController userInput = TextEditingController(text: '');
    TextEditingController courtInput = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
            child: Column(
              children: [
                TextFormFieldCustom(
                  controller: userInput,
                  hintText: 'Nombre del responsable',
                                  labelText: '',
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    hint: const Text('Selecciona cancha'),
                    // Down Arrow Icon
                    icon: Row(
                      children: const [
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),

                    // Array list of items
                    items: courts.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        //ropdownvalue = newValue!;
                        courtInput.text = newValue ?? '';
                      });
                    },
                  ),
                ),
                TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: const InputDecoration(
                    hintText: 'Fecha',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      dateInput.text = formattedDate;
                    } else {}
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(SaveCourtStarted(Court(
                              court: courtInput.text,
                              date: dateInput.text,
                              user: userInput.text)));
                          Navigator.pop(context);
                        },
                        child: const Text('Guardar')))
              ],
            ),
          ),
        );
      },
    );
  }
}
