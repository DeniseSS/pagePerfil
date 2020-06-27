import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 File imageFile;

_openGallery(BuildContext context) async{
  var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  this.setState((){
    imageFile = picture;
  });
  Navigator.of(context).pop();
}
_openCamera(BuildContext context) async{
   var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
    imageFile = picture;
  });
  Navigator.of(context).pop();
}
Future <void> _showChoiceDialog(BuildContext context){
  return showDialog(context: context,builder: (BuildContext context){
    return AlertDialog(
      title: Text("Imagem"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: Text("Galeria"),
              onTap: (){
                _openGallery(context);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            GestureDetector(
              child: Text("Câmera"),
              onTap: (){
                _openCamera(context);
              },
            ),
          ],
        )
      )
    );
  });
}

  @override
Widget _decideImageView(){
  if(imageFile == null){
    return    Container(
              
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: 150,
              height:150,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
         ),
    );
  }
  else{
   return
      Container(
              child:Image.file( imageFile, width: 250, height:220, ),
              
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: 150,
              height:150,
              decoration: BoxDecoration(
                
              shape: BoxShape.circle,
              color: Colors.grey[300],
              
         ),
  
      );
  }
} 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        elevation:0,
        leading: BackButton(),
        title: Text('Perfil'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){},
          ),
        ],
    ),
    body: ListView(children:<Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
            ),
            ),
            child: Column(
              
              children: <Widget>[
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  
                  children: <Widget>[
                    Column(
                      
                      children: <Widget>[
                             
                             _decideImageView(),
                           
                        
                      ],
                    )
                  ],
                ),
                SizedBox(height: 22),
                Text('Luiza',
                style: TextStyle(color: Colors.white),),
                SizedBox(height: 10),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.camera_alt),
                  onPressed:(){
                     _showChoiceDialog(context);
                  },
                ),
                /*Text('Luiza'.toUpperCase(), 
                style:TextStyle(color: Colors.white,
                fontSize: 20),)*/
              ],
            )
          
        ),
         SizedBox(height:5),
        Container(
           padding: EdgeInsets.fromLTRB(2, 20, 2, 15),
          child: Column(
            
            children: <Widget>[
              
              ListTile(
                
                leading: Icon(Icons.person, color:Colors.black),
                title: Text('Perfil'),
                ),
              ListTile(
                leading: Icon(Icons.photo_album, color:Colors.black),
                title: Text('Album'),
              ),
              ListTile(
                leading: Icon(Icons.email, color:Colors.black),
                title: Text('Email'),
              ),
              ListTile(
                leading: Icon(Icons.phone, color:Colors.black),
                title: Text('Fone'),
              ),
              ListTile(
                leading: Icon(Icons.lock, color:Colors.black),
                title: Text('Conta'),
              ),
            ],
          ),
        ),
        SizedBox(height:20),
       
      ],  ),
    );
  }
}
