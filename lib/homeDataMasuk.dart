import 'package:flutter/material.dart';
import 'package:project/halamanutama.dart';
import 'package:project/entryform.dart';
import 'package:project/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:project/navigation.dart';
import 'dart:async';
import 'models/item.dart';
import 'package:project/navigation.dart';

//pemdukung program asinkron

class HomeDataMasuk extends StatefulWidget{
  @override
  HomeDataMasukState createState() => HomeDataMasukState();

}
class HomeDataMasukState extends State<HomeDataMasuk>{

  DbHelper dbHelper = DbHelper();
  int count =0;
  List<Item> itemList;


  @override
  Widget build(BuildContext context){
    updateListView();
    if( itemList ==null){
      itemList = List<Item>();
    }
    
    return Scaffold(
      appBar: AppBar(
       leading: new IconButton(
         icon : Icon (Icons.arrow_back, color:Colors.black,), 
       onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => Navigation()// untuk kembali ke halaman home
              ),
              );
        } ,
        ),
       title: Text("Data Barang Masuk"), //membuat text pada appbar
       backgroundColor: Colors.grey, //memberi warna pada appbar
       ),
       backgroundColor: Colors.grey.shade100,//memberi warna pada baground homeDataMasuk
      body: Column(children: [
        Expanded(child: createListView(),),
        Container(
            child: RaisedButton(
              child: Icon(Icons.add,size: 40.0,color: Colors.black,),
              onPressed: () async {
                  var item = await navigateToEntryForm(context,null);
                  if(item !=null){
                    //Panggil Fungsi untuk Insert ke DB
                    int result = await dbHelper.insert(item);
                    if(result > 0){
                      updateListView();
                    }
                  }
              },
                    ),
          ),
      ]),
    );
  }

  Future<Item> navigateToEntryForm(BuildContext context,Item item) async{
      var result = await Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (BuildContext context){
            return EntryForm(item);
          } 
          )
          );
          return result;
  }
  
  ListView createListView(){
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //menata text agar ada di bagian kiri
                  children: <Widget>[
                   Text( this.itemList[index].name, style: TextStyle(fontSize :18.0, fontWeight: FontWeight.bold),
                   ), //menampilkan text nama yang telah diinputkan yang diambil dari db
                   Text(' Merk     : '  + this.itemList[index].merk), //menampilkan text merk yang telah diinputkan yang diambil dari db
                   Text(' Harga   : Rp ' + this.itemList[index].price.toString()), //menampilkan text Harga yang telah diinputkan yang diambil dari db
                   Text(' Stok      : '  + this.itemList[index].stok.toString()  +  'pcs'),
                   Text(' Masuk  : '  + this.itemList[index].tanggalmasuk), //menampilkan text Stok yang telah diinputkan yang diambil dari db
                  ],
                                  ),
                ),
                   IconButton(
                  onPressed: () async{
                    var item =
                    await navigateToEntryForm(context,this.itemList[index]);
                    // Panggil Fungsi Untuk Edit data
                    int result = await dbHelper.update(item);
                    if (result > 0){
                      updateListView();
                    }
                    },
                   icon: Icon(Icons.edit), //untuk icon edit
          ),
                  IconButton(
                  onPressed: () async{
                     //Panggil Fungsi Untuk Delete data
                    int result = await dbHelper.delete(itemList[index].id);
                      if (result > 0){
                        updateListView();
                      }
                  },
                   icon: Icon(Icons.delete, color: (Colors.red), // untuk icon delete
                ),
                  ),
              ]
            ),
          );
        },
      );
    }
  //update List item
    void updateListView() {
      final Future<Database> dbFuture = dbHelper.initDb();
      dbFuture.then((database) {
        //TODO 1 Select data dari DB
        Future<List<Item>> itemListFuture = dbHelper.getItemList();
        itemListFuture.then((itemList) {
          setState(() {
            this.itemList = itemList;
            this.count = itemList.length;
            });
          });
        });
     }
     }