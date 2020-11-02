import 'package:adov_flutter/widgets/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

TextEditingController titleController = TextEditingController();
DateTime date;
DateTime time;

class AddTalkFormState extends State<AddTalk> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add a Talk'),
      ),
      body: GestureDetector(
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
                  ),
                  validator: (value) {
                    return (value.isEmpty) ? 'Please enter a title' : null;
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
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Expanded(
                            child: DateTimeField(
                              decoration: InputDecoration(
                                labelText: "Talk Date",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 1.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  ),
                                ),
                                errorStyle: TextStyle(height: 0),
                              ),
                              format: DateFormat("dd/MM/yyyy"),
                              validator: (date) {
                                return (date == null)
                                    ? ""
                                    : null;
                              },
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                              },
                              onChanged: (d) {
                                date = d;
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
                              decoration: InputDecoration(
                                labelText: "Talk Time",
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 1.5
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  ),
                                ),
                                errorStyle: TextStyle(height: 0),
                              ),
                              format: DateFormat("HH:mm"),
                              validator: (time) {
                                return (time == null)
                                    ? ""
                                    : null;
                              },
                              onChanged: (t) {
                                time = t;
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
                      )
                    ],
                  )),
              Divider(color: Colors.grey),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            final snackBar = SnackBar(content: Text("Adding Talk"));
            FocusScope.of(context).unfocus();
            _scaffoldKey.currentState.showSnackBar(snackBar);
          } else {
            Toast.show("Added talk - not implemented", context);
          }
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class AddTalk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTalkFormState();
  }
}
