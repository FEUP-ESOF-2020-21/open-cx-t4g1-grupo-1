import 'package:adov_flutter/database/talks_database.dart';
import 'package:adov_flutter/models/talk.dart';
import 'package:adov_flutter/style.dart';
import 'package:adov_flutter/widgets/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';


TextEditingController titleController = TextEditingController();
TextEditingController roomController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
DateTime selectedDate = DateTime(2020);
DateTime selectedTime = DateTime(2020);

class AddTalkFormState extends State<AddTalk> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add a Talk'),
        backgroundColor: MainColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: titleController,
                    autocorrect: true,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "Title",
                      focusColor: MainColor,
                    ),
                    validator: (value) {
                      return (value.isEmpty) ? '' : null;
                    },
                  ),
                ),
                Divider(color: Colors.grey),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Expanded(
                              child: DateTimeField(
                                decoration: CustomInputDecorator.decorator("Talk Date"),
                                format: DateFormat("dd/MM/yyyy"),
                                validator: (date) {
                                  return (date == null) ? "" : null;
                                },
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                onChanged: (d) {
                                  selectedDate = d;
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20)),
                            Expanded(
                              child: DateTimeField(
                                decoration: CustomInputDecorator.decorator("Talk Time"),
                                format: DateFormat("HH:mm"),
                                validator: (time) {
                                  return (time == null) ? "" : null;
                                },
                                onChanged: (t) {
                                  selectedTime = t;
                                },
                                onShowPicker: (context, currentValue) async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        currentValue ?? DateTime.now()),
                                  );
                                  return DateTimeField.convert(time);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Divider(color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextFormField(
                    controller: roomController,
                    autocorrect: true,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: CustomInputDecorator.decorator("Talk Room"),
                    validator: (value) {
                      return (value.isEmpty) ? '' : null;
                    },
                  ),
                ),
                Divider(color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: descriptionController,
                    autocorrect: true,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: CustomInputDecorator.decorator("Description"),
                    validator: (value) {
                      return (value.isEmpty) ? '' : null;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            final snackBar =
                SnackBar(content: Text("Adding Talk..."));
            FocusScope.of(context).unfocus();
            _scaffoldKey.currentState.showSnackBar(snackBar);
            _addTalk();
            Navigator.pop(context);
          } else {
            Toast.show("Some fields are not filled", context);
          }
        },
        child: Icon(Icons.done),
        backgroundColor: MainColor,
      ),
    );
  }
}

_addTalk() {
  var title = titleController.text;
  var _date = selectedDate;
  var _time = TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute);
  var room = roomController.text;
  var description = descriptionController.text;

  var talk = Talk(title, room, _time, _date, description,
      'assets/images/kiyomizu-dera.jpg');
  TalksDatabase.saveTalk(talk);
}

class AddTalk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTalkFormState();
  }
}
