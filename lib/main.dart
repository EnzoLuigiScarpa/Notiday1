import 'package:flutter/material.dart';
import 'package:notiday/registrar.dart';
import './login.dart';

//Arquivo main, contendo a classe com nome do app.
void main() {
  runApp(MaterialApp(home: (Notiday())));
}

//class _NotidayState que recebe por herança a mudança de estado da classe Notiday.
class _NotidayState extends State<Notiday> {
  _NotidayState createState() {
    return _NotidayState();
  }

  //primeira tela do app
  @override
  Widget build(BuildContext context) {
    //o context vai retornar um Scaffold contendo vários elementos.
    return Scaffold(
      //center fazendo alinhamento centralizado da body
      body: Center(
        //column vai fazer a organização dos elementos em coluna,
        // mainaxisAlignment.center vai cuidar de centralizar os elemntos
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //container para dimensionar tamanho da imagen.
            Container(
              margin: EdgeInsets.all(5),
              width: 200,
              height: 200,
              child: Image.asset('assets/notiday.png'),
            ),
            //container que vai conter frase de apresentação do app,
            // utilizando o widget Text, que esta sendo estilizado através da class TextStyle.
            Container(
              child: Text(
                "    Achou que iria esquecer?\n"
                "        Notiday lembra você!",
                style: TextStyle(
                    fontFamily: AutofillHints.birthday,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //container para alinhamento do botão com relação ao elemento pai
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  //botão que irá levar a tela de login, utilizando a class Navigator com o método push.
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Color.fromARGB(255, 243, 166, 0),
                ),
              ),
            ),
            //container para alinhamento do botão com relação ao elemento pai
            Container(
                child: ElevatedButton(
              onPressed: () {
                //botão que irá levar a tela de cadastro, utilizando a class Navigator com o método push.
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Registrar(),
                  ),
                );
              },
              child: Text('Cadastre-se'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Color.fromARGB(255, 243, 166, 0),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}

//Class super
class Notiday extends StatefulWidget {
  _NotidayState createState() {
    return _NotidayState();
  }
}
