import 'package:flutter/material.dart';
import 'package:project/halamanutama.dart';
import 'package:project/entryformkeluar.dart';
import 'package:project/navigation.dart';
import 'models/item1.dart';
import 'package:project/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';



//pemdukung program asinkron

class HomeDataKeluar extends StatefulWidget{
  @override
  HomeDataKeluarState createState() => HomeDataKeluarState();

}
class HomeDataKeluarState extends State<HomeDataKeluar>{

  DbHelper dbHelper = DbHelper();
  int count =0;
  List<Item1> item1List;


  @override
  Widget build(BuildContext context){
    updateListView();
    if( item1List ==null){
      item1List = List<Item1>();
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
       title: Text("Data Barang Keluar"), //membuat text pada appbar
       backgroundColor: Colors.grey, //memberi warna pada appbar
       ),
       backgroundColor: Colors.grey.shade100,//memberi warna pada baground homeDataMasuk
      body: Column(children: [
        Expanded(child: createListView(),),
        Container(
            child: RaisedButton(
              child: Icon(Icons.add,size: 40.0,color: Colors.black,),
              onPressed: () async {
                  var item1 = await navigateToEntryForm(context,null);
                  if(item1 !=null){
                    //Panggil Fungsi untuk Insert ke DB
                    int result = await dbHelper.insert1(item1);
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

  Future<Item1> navigateToEntryForm(BuildContext context,Item1 item1) async{
      var result = await Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (BuildContext context){
            return EntryForm1(item1);
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
                   Text(this.item1List[index].name, style: TextStyle(fontSize :18.0, fontWeight: FontWeight.bold),
                   ), //menampilkan text nama yang telah diinputkan yang diambil dari db
                   Text(' Merk                : '  + this.item1List[index].merk), //menampilkan text merk yang telah diinputkan yang diambil dari db
                   Text(' Toko Reseller : ' + this.item1List[index].reseller.toString()),//menampilkan text reseller yang telah diinputkan yang diambil dari db
                   Text(' Keluar              : '  + this.item1List[index].tanggalkeluar),//menampilkan tanggal yang telah diinputkan yang diambil dari db
                   Text(' Jumlah            : ' + this.item1List[index].jumlah.toString() + 'pcs')//menampilkan Jumlah yang telah diinputkan yang diambil dari db
                  ],
                                  ),
                ),
                   IconButton(
                  onPressed: () async{
                    var item1 =
                    await navigateToEntryForm(context,this.item1List[index]);
                    // Panggil Fungsi Untuk Edit data
                    int result = await dbHelper.update1(item1);
                    if (result > 0){
                      updateListView();
                    }
                    },
                   icon: Icon(Icons.edit), //untuk icon edit
          ),
                  IconButton(
                  onPressed: () async{
                     //Panggil Fungsi Untuk Delete data
                    int result = await dbHelper.delete1(item1List[index].id);
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
        Future<List<Item1>> item1ListFuture = dbHelper.getItem1List();
        item1ListFuture.then((item1List) {
          setState(() {
            this.item1List = item1List;
            this.count = item1List.length;
            });
          });
        });
     }
     }