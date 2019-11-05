import 'dart:io';

import 'package:agenda_de_contatos_flutter_app/helpers/contact_helper.dart';
import 'package:agenda_de_contatos_flutter_app/ui/ContactPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactHelper helper = ContactHelper(); //Singletone
  List<Contact> contacts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //carrega os contatos do banco
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  //teste do banco de dados
  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Contact c = Contact();
    c.name = "Danilo Silva";
    c.email = "danilovaleriosilva@gmail.com";
    c.phone = "123456789";
    c.img = "imgcontato";

    helper.saveContact(c);

    helper.getAllContacts().then((list) {
      print(list);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index){
    //como card não tem toque adicionamos um gesture
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img != null ?
                    FileImage(File(contacts[index].img)) :
                    AssetImage("images/robot.png")
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contacts[index].name ?? "",
                    style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.bold),
                    ),
                    Text(contacts[index].email ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        _showContactPage(contact: contacts[index]);
      },
    );
  }

  void _showContactPage({Contact contact}){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => ContactPage(contact: contact,))
    );
  }
}
