import 'package:flutter/material.dart';
import 'package:project/models/item1.dart';
import 'package:project/homeDataKeluar.dart';

class EntryForm1 extends StatefulWidget{
  final Item1 item1;

  EntryForm1(this.item1);
  
  @override
  EntryForm1State createState() => EntryForm1State(this.item1);
 }

  //class controller
  class EntryForm1State extends State<EntryForm1>{
    Item1 item1;

    EntryForm1State(this.item1);

    TextEditingController merkController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController resellerController = TextEditingController();
    TextEditingController tanggalkeluarController = TextEditingController();
    TextEditingController jumlahController = TextEditingController();

    @override
    Widget build(BuildContext context){
      //kondisi
      if(item1 !=null){
        nameController.text = item1.name;
        resellerController.text =item1.reseller;
        merkController.text = item1.merk;
        tanggalkeluarController.text = item1.tanggalkeluar;
        jumlahController.text = item1.jumlah.toString();
        
      }
      //rubah
      return Scaffold(
        appBar: AppBar(
          title: item1 == null ? Text('Tambah Data') : Text('Ubah'),
          leading: new IconButton( //button
         icon : Icon (Icons.arrow_back, color:Colors.black,), // icon button back
       onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeDataKeluar()// untuk kembali ke halaman home
              ),
              );
        } ,
          ),
          ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0,left:10.0,right: 10.0),
          child: ListView(
            children: <Widget>[
             Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: merkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.content_paste ),
                    labelText: 'Merk Sepatu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
              //nama
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.store),
                    labelText: 'Jenis Sepatu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
              //reseller
              Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: resellerController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.attach_money_rounded),
                    labelText: 'Reseller',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
            //tanggalkeluar
            Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: tanggalkeluarController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range_sharp),
                    labelText: 'Tanggal Keluar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
              //jumlah
              Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.add_shopping_cart),
                    labelText: 'Jumlah',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
            //tombol button
            Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
              child: Row(
                children: <Widget>[
                  //tombol simpan
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        if(item1 ==null){

                          //tambah data
                          item1 = Item1(nameController.text, merkController.text,resellerController.text, tanggalkeluarController.text,int.parse(jumlahController.text));
                        } else{
                          //ubah data
                          item1.name = nameController.text;
                          item1.merk = merkController.text;
                          item1.reseller = resellerController.text;
                          item1.tanggalkeluar = tanggalkeluarController.text;
                          item1.jumlah= int.parse(jumlahController.text);
                        }
                        //kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item1);
                        },
                    ),
                  ),
                  Container(width: 5.0),
                  //tombol batal
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    ),
                ],
              ),
            ),
          ],
          ),
        )
      );
    }
  }



        
  
