import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Appdata extends StatefulWidget {
  const Appdata({Key? key}) : super(key: key);

  @override
  _AppdataState createState() => _AppdataState();
}
 
class _AppdataState extends State<Appdata> {
  TextEditingController? _nameController, _numberController;
  DatabaseReference? _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    
    _ref = FirebaseDatabase.instance.reference().child('contacts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Store Data'),
        /*   actions: <Widget>[
         // IconButton(
              onPressed: () {
                Navigator.pop(context, Screen());
              },
              icon: ,
        ],*/ 
      ),
      body: Container(
          margin: EdgeInsets.all(15), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  prefixIcon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: _numberController,
                decoration: InputDecoration(
                  hintText: 'Enter Number',
                  prefixIcon: Icon(
                    Icons.phone_android,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          storedata();
                          validate();
                        },
                        child: Text('Store_Data'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          primary: Colors.teal,
                          onPrimary: Colors.black,
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }

  void storedata() {
    String name = _nameController!.text;  
    String number = _numberController!.text;

    Map<String, String> contacts = {
      'name': name,
      'number': '+91' + number,
    };

    _ref!.push().set(contacts).then((value) => {Navigator.pop(context)});
  }

  void validate() {
     
  }
}
