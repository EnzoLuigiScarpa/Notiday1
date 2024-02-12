import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notiday/login.dart';
import 'package:notiday/main.dart';

class _RegistrarState extends State<Registrar> {
  // conjunto de variaveis de controle
  bool aceito = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: Container(
                    height: 5.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFEFE),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(150, 0, 0, 0),
                          width: 5.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Notiday(),
                              ),
                            );
                          },
                          color: Colors.black,
                        ),
                        Text('Cadastro'),
                        IconButton(
                          onPressed: () {},
                          color: Colors.black,
                          icon: Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 470,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(fontSize: 10),
                      decoration: InputDecoration(
                        labelText: 'NOME',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(fontSize: 5),
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'SOBRENOME',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(fontSize: 5),
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: Colors.blue,
                        labelText: 'E-MAIL',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(fontSize: 5),
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'TELEFONE',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style: TextStyle(fontSize: 5),
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'SENHA',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      style:
                          TextStyle(fontSize: 5, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        labelText: 'CONFIRMAR SENHA',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: aceito,
                        onChanged: (bool? checked) {
                          setState(() {
                            aceito = checked ?? false;
                          });
                        },
                      ),
                      Text('Concordo com os Termos e Políticas')
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 243, 166, 0),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        Size(200, 50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Notiday(),
                        ),
                      );
                    },
                    child: Text(
                      'Registrar',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                image: AssetImage('assets/notiday.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Registrar extends StatefulWidget {
  _RegistrarState createState() {
    return _RegistrarState();
  }
}
