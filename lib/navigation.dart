import 'package:flutter/material.dart';
import 'package:project/barang.dart';
import 'package:project/halamanutama.dart';

class Navigation extends StatefulWidget{
  @override
 NavigationState createState() => NavigationState();

}
class NavigationState extends State<Navigation>{
  int _selectIndex = 0;
 List<Widget> _widgetOptions = <Widget>[
    HalamanUtama(),
    Barang(),
  ];
 @override
 void initState(){
   super.initState();
 }

  @override
  Widget build(BuildContext context){
   return Scaffold(
      body : _widgetOptions[_selectIndex],
      bottomNavigationBar : BottomNavigationBar(
                     type: BottomNavigationBarType.fixed,
                     onTap: (index){
                       setState(() {
                         _selectIndex = index;
                       });
                     },
                     currentIndex: _selectIndex,
                     iconSize: 25,
                     items: [
                          BottomNavigationBarItem(
                            icon : Icon(Icons.home),
                            title: Text('Home'),
                            backgroundColor : Colors.black,
                          ),
                          BottomNavigationBarItem(
                            icon : Icon(Icons.shopping_bag),
                            title: Text('Barang'),
                            backgroundColor : Colors.black,
                          ),  
                     ],
                   ),
   );
  }
}