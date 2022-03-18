import 'package:flutter/material.dart';
class Informacion extends StatelessWidget {
  final String name;
  final int edad;
  final String descripcion;
  const Informacion({
     Key? key,
     required this.name,
     required this.edad,
     required this.descripcion,
      }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.fromLTRB(35,50,35,50),
        width: double.infinity,
        height: deviceHeight * 3 / 6,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        Text(name,
        style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 5),
        Text(edad.toString() + ' Años',
        ),
        const SizedBox(height: 30),
        Text('Carrera',
        style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 30),
        Text('Sobre mí',
        style: Theme.of(context).textTheme.headline5,
        ),

        Text(descripcion, 
        ),

        ],
            
          ),
        )
        
      )

    );
  }
}