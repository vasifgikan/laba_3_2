import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key key, this.list}) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 160, 221, 2),
      body: Center(
          child: ListView.separated(
              physics: ScrollPhysics(),
              separatorBuilder: (context, index)=>Divider(
                color: Colors.white,
                endIndent: 45,
                indent: 45,
                thickness: 0.0,

              ),
              itemCount: list.length,
              itemBuilder: (context, index){
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  leading: Text(list[index]["ID"].toString(), style: TextStyle(color: Colors.white, fontSize: 20) ),
                  title: Text('${list[index]["NAME"].toString()} ${list[index]["SURNAME"].toString()} ${list[index]["SECONDNAME"].toString()}', style: TextStyle(color: Colors.white, fontSize: 20)),

                  subtitle: Text(list[index]["DATE"].replaceAll('T', ' '), style: TextStyle(color: Colors.white)),
                  isThreeLine: true,

                );
              }
          )
      ),
    );
  }
}