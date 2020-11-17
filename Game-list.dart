import 'package:flutter/material.dart';

void main() {runApp(MaterialApp(
	title: 'Avaliação',
	 theme: ThemeData(
	   primarySwatch: Colors.red
         ),
         home: Usuario(),
      )
    );
}



class Usuario extends StatefulWidget {
  @override
  FormularioUsuario createState() {
    return FormularioUsuario();
  }
}

class FormularioUsuario extends State<Usuario> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String usuario = "";
  String senha = "";
  var contexto;
  
  @override
  Widget build(BuildContext context) {
    contexto = context;
    return MaterialApp(
        home: Scaffold(
            key: scaffoldKey,
            body: Center(child:  
            SingleChildScrollView(
                child: Container(
              margin: new EdgeInsets.all(15.0),
              child: Form(
                  key: formKey, 
                  child: FormularioUsuarioUI(this)),
            )))));
  }
}

Widget FormularioUsuarioUI(var meuFormulario) {


  return Column(children: [
    Text("Cadastra-se"),
    TextFormField(
        decoration: InputDecoration(labelText: "Nome do usuario:"),
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.usuario = val;
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Senha:"),
        onSaved: (String val) {
           meuFormulario.setState(() {
            meuFormulario.senha = val;
          });
        }),
    RaisedButton(
        child: Text("Entrar"),
        onPressed: () {
          meuFormulario.formKey.currentState.save();

          
          
          if (meuFormulario.usuario == "Elysabio" && 
             meuFormulario.senha == "4556") {
            
            Navigator.push(
              meuFormulario.contexto,
MaterialPageRoute(builder: (context) => Consulta())); 
            
            
          } else {
              meuFormulario.scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                  "Usuário ou senha inválidos, tente novamente")));
          }
           

        }
      )
  ]);
}



class Consulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games'),
      
      ),
      body:
        Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:[
             Expanded(
               flex: 5,
               child: 
                ListView(children: [
                  ListTile(
                    leading: const Icon(Icons.arrow_back_ios ),
                    title: const Text("Ori and the Blind Forest (2015)"),
                    subtitle: const Text("Moon studios"), 
                    onTap: () => Consulta(), 
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_back_ios ),
                    title: const Text("Red Dead redemption (2011)"),
                    subtitle: const Text("Rockstar Games"), 
                    onTap: () => Consulta(), 
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_back_ios ),
                    title: const Text("Cyberpunk 2077 (2077)"),
                    subtitle: const Text("CD Projekt"), 
                    onTap: () => Consulta(), 
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_back_ios ),
                    title: const Text("Age of Empires II (1999)"),
                    subtitle: const Text("Ensemble Studios"), 
                    onTap: () => Consulta(), 
                  ),
                 
                  
                ],
              ),
              ),
              Expanded(child: 
               Align(
        alignment: Alignment(0.80,0.90),
        child: FloatingActionButton(
        onPressed: () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => SegundaRota()),
            );
          }, 
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),      
      ),
              )
           ]
          )
    
    ); 
  }

  
}





class SegundaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de dejeso"),),
      body: Column(
        children: [
        Text("Adicione um novo jogo"),
      TextFormField(
        decoration: InputDecoration(labelText: "Nome:"),
        ),
      TextFormField(
        decoration: InputDecoration(labelText: "Lançamento:"),
        ),
      TextFormField(
        decoration: InputDecoration(labelText: "Genero:"),
        ),
      TextFormField(
        decoration: InputDecoration(labelText: "Empresa:"),
        ),
        Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Adionar'),
        ),
      ),
      ]
    )
    );
}
}