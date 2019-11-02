import 'package:agenda_de_contatos_flutter_app/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ContactHelper helper = ContactHelper();//Singletone

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Contact c = Contact();
    c.name = "Danilo Silva";
    c.email = "danilovaleriosilva@gmail.com";
    c.phone = "123456789";
    c.img = "imgcontato";

    helper.saveContact(c);

  helper.getAllContacts().then((list){
    print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
