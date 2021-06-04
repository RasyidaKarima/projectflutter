import 'package:flutter/material.dart';
import 'package:project/barang.dart';
import 'package:project/homeDataMasuk.dart';
import 'package:project/homeDataKeluar.dart';

class HalamanUtama extends StatefulWidget{
  @override
  HalamanUtamaState createState() => HalamanUtamaState();

}
class HalamanUtamaState extends State<HalamanUtama>{
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
     appBar: AppBar(
       leading: new Icon(Icons.home_work, color:Colors.black,), //membuat icon rumah pada appbar
       title: Text("Gudang Sepatu"), //membuat text pada appbar
       backgroundColor: Colors.grey, //memberi warna pada appbar
       ),
       backgroundColor: Colors.grey.shade200,//memberi warna pada baground halaman utama
       body : Container(
         padding : EdgeInsets.all(40.0),//memberi jarak antar object
         child: GridView.count(//membuat gridview
           crossAxisCount: 1,// menambahkan agar gridview 1 kotak 
           children: <Widget>[
             Card( //membuat card
               margin : EdgeInsets.all(40.0),//memberi jarak antar object
               child: InkWell(//fungsi untuk berpindah ke halaman yang dituju
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => HomeDataMasuk() ),
                   );
                 },//membuat agar ketika kita klik menuju halaman yang dituju
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,//agar posisi icon ada di tengah
                     children: <Widget>[
                       Icon(Icons.local_shipping_sharp ,size :80.0), //menambahkan icon didalam card
                       Text("Data Barang Masuk",style :new TextStyle(fontSize: 12.0)), //menambahkan text dan memilih ukuran text didalam card
                     ],
                     ),
                     ),
                     ),
             ),
             Card(
               margin : EdgeInsets.all(40.0),
               child: InkWell(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => HomeDataKeluar() ),
                   );
                 },
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Icon(Icons.exit_to_app_outlined,size :80.0),
                       Text("Data Barang Keluar",style :new TextStyle(fontSize: 12.0)),
           ],
         ),
         ),
            ),
             ),
           ],
         ),
       ),
   );            
     }
}
        