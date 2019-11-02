import 'package:agenda_de_contatos_flutter_app/helpers/contact_helper.dart';
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
    helper.getAllContacts().then((list){
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
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: contacts.length,
          itemBuilder: (context, index){

            },
    );
  }
}
