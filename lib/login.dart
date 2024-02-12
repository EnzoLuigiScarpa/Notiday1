import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notiday/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class _Login extends State<Login> {
//função ja pré-estabelida pelo flutter que permiti interagir com textflied TEXTEDITINGCONTROLLER
  TextEditingController _permisaoLogin = TextEditingController();
  TextEditingController _permisaoSenha = TextEditingController();
  String login = '';
  String senha = '';
  bool _permisao = false;
  bool _permisaoS = false;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

//função _permitir valores, faz a atualização através do setState dos valores das variáveis,
// e retorna se o text foi preenchido dentro do TextField..
  void _permitirLogin() {
    setState(() {
      _permisao = _permisaoLogin.text.isNotEmpty;
      _permisaoS = _permisaoSenha.text.isNotEmpty;
    });
  }

  Future<void> _handleSignIn() async {
    try {
      await googleSignIn.signIn();
      // O usuário está conectado.
      // Agora você pode usar googleSignIn.currentUser para obter os detalhes do usuário.
    } catch (error) {
      // Tratar erros de login.
      print('Erro ao efetuar login com o Google: $error');
    }
  }

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
                    height: 100.0,
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
                      children: [
                        //botão de voltar a pagina anterior, utilizando a class Navigator com o método push.
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
                        //spacer faz o espaço entre os elementos dentro de um row, colocando nas extremidades
                        Spacer(),

                        //botão de menu
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

        //corpo do widget esta utilizando o center para centralizar os elementos.
        body: Center(
          child: Column(
            children: [
              //container faz o dimensionamento do tamanho da imagem em 200 tamanho e 200 .
              Container(
                margin: EdgeInsets.all(5),
                width: 200,
                height: 200,
                child: Image.asset('assets/notiday.png'),
              ),
              //texto descritivo do app
              Text(
                "    Bem-Vindo ao Notiday",
                style: TextStyle(
                    fontFamily: AutofillHints.birthday,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              //nome do app
              Text(
                "NOTIDAY",
                style: TextStyle(
                    fontFamily: AutofillHints.telephoneNumberCountryCode,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 163, 240)),
              ),
              // container para atribuir um padding e assegurar o tamanho dos elementos e conjuntos de widget.
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    //padding para adicionar uma borda interna ao elemento de 4 pixels, utilizado em ambos TextField.
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: _permisaoLogin,
                        style: TextStyle(fontSize: 10),
                        decoration: InputDecoration(
                          labelText: 'Login',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        onChanged: (value) {
                          _permitirLogin();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        controller: _permisaoSenha,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        onChanged: (value) {
                          _permitirLogin();
                        },
                      ),
                    ),
                    Row(
                      //mainaxiAligmente para alinhar atraves do spaceEvenly,
                      // que faz alinhamento do centro para extremidade alinhando os espaços cimétricamente.
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, backgroundColor: Color.fromARGB(255, 243, 166, 0)),
                          //através de 2 instancias da classe  TextEditingController,
                          //utilizamos duas variáveis para permitir o login, uma porta lógica AND para analisar ambos valores,
                          //e uma condição para verificar se dentro das variaveis foram atribuidos valores atraves do formulário.
                          onPressed: _permisao && _permisaoS ? () {} : null,
                          child: Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        //textbutton que vai direcionar ao e-mail para enviar a nova senha.
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ), //padding envolvendo elementos de uma row para determinar margens internas de 20 pixels.
              Padding(
                padding: const EdgeInsets.all(20.0),
                //row fazendo alinhamento ao fim da tela com 3 elementos
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Iconbutton fazendo a conexão com login via faacebook.
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                      onPressed: _handleSignIn,
                    ),
                    //TextButton que ao clicar irá mostrar todos termos e política do aplicativo.
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                      onPressed: () {},
                      child: Text('Termos e Politicas'),
                    ),
                    //IconButton fazendo a conexão com login através do Google.
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Class Login Stateful, que irá permitir a mudança dos elementos durante o uso do app.
class Login extends StatefulWidget {
  _Login createState() {
    return _Login();
  }
}
