import 'dart:math';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class AddList extends StatefulWidget {
  AddList({Key key, this.db}) : super(key: key);
  final Database db;
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  TextEditingController _controller, _controller1;
  FocusNode _node = FocusNode();
  FocusNode _node1 = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(221, 160, 221, 2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.width/2),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5), child:TextFormField(
                controller: _controller,
                cursorColor: Colors.white,

                style: TextStyle(height: 1.0, color: Colors.white, fontSize: 18),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,

                onFieldSubmitted: (t){
                  toNext(context, _node, _node1);
                },
                focusNode: _node,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  hintText: 'ID',
                  hintStyle: TextStyle(height: 1.0, color: Colors.white, fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide:BorderSide(
                        color:Colors.lightBlueAccent
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              ),
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5), child:TextFormField(
                focusNode: _node1,
                controller: _controller1,
                cursorColor: Colors.white,
                style: TextStyle(height: 1.0, color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  hintText: 'ФИО',
                  hintStyle: TextStyle(height: 1.0, color: Colors.white, fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide:BorderSide(
                        color:Colors.lightBlueAccent
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              ),
              SizedBox(height:30),
              MaterialButton(
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(35),
                    side: BorderSide(
                        color: Colors.white,
                        width: 1
                    )
                ),
                splashColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                onPressed: ()async{
                  RandomStudent rs = RandomStudent(date: DateTime.now().toIso8601String(), fio: _controller1.text, id: int.parse(_controller.text));
                  await DBProvider().insert(widget.db, rs);
                },
                child: Text('Применить', style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
              SizedBox(height: 30),
              MaterialButton(

                color: Colors.lightBlue,
                //color: Color.fromARGB(255, 39, 135, 204),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                    side: BorderSide(
                        color: Colors.transparent,
                        width: 1
                    )
                ),
                splashColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24.95),
                onPressed: ()async{
                  Random rnd = Random();
                  RandomStudent rs = RandomStudent(id: rnd.nextInt(99999)+10000, fio: RandomStudent().getFIO(), date: DateTime.now().toIso8601String(),);
                  await DBProvider().insert(widget.db, rs);
                },
                child: Text('Случайные значения', style: TextStyle(fontSize: 20, color: Colors.white),),

              ),
              SizedBox(height:10),
            ],
          ),
        ),
      ),
    );
  }
  toNext(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}