//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:project/halamanutama.dart';
import 'package:project/navigation.dart';


//package letak folder Anda
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,//tidak menampilkan banner debug pada app bar 
      theme: ThemeData( //memberi tema warna
      primarySwatch: Colors.grey,
      ),
      home: Navigation(), //untuk menuju halaman utama
    );
  }
}