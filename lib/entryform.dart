import 'package:flutter/material.dart';
import 'package:project/models/item.dart';

import 'homeDataMasuk.dart';

class EntryForm extends StatefulWidget{
  final Item item;

  EntryForm(this.item);
  
  @override
  EntryFormState createState() => EntryFormState(this.item);
 }

  //class controller
  class EntryFormState extends State<EntryForm>{
    Item item;

    EntryFormState(this.item);

    TextEditingController merkController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController stokController = TextEditingController();
    TextEditingController tanggalmasukController = TextEditingController();

    @override
    Widget build(BuildContext context){

      //kondisi
      if(item !=null){
        merkController.text = item.merk;
        nameController.text = item.name;
        priceController.text = item.price.toString();
        stokController.text = item.stok.toString();
        tanggalmasukController.text = item.tanggalmasuk;
        
      }
      //rubah
      return Scaffold(
        appBar: AppBar(
          title: item == null ? Text('Tambah Data') : Text('Ubah'),
          leading: new IconButton(
         icon : Icon (Icons.arrow_back, color:Colors.black,), //menambah icon back
       onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeDataMasuk()// untuk kembali ke halaman home
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
                  controller: merkController, //menambahkan controller 
                  keyboardType: TextInputType.text, //untuk keyboar type text
                  decoration: InputDecoration(
                    icon: Icon(Icons.content_paste ),//menambahkan icon
                    labelText: 'Merk Sepatu', //text
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(20.0), //membuat border melengkung 
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
              //harga
              Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.attach_money_rounded),
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
             Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: stokController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.add_shopping_cart),
                    labelText: 'Stok',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                onChanged: (value) {
                //
                },
              ),
            ),
            Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: tanggalmasukController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range_sharp),
                    labelText: 'Tanggal Masuk',
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
                    child: RaisedButton(//button save
                      color: Theme.of(context).primaryColorDark, //memberi warna pada button
                      textColor: Theme.of(context).primaryColorLight, //memberi warna pada text yang ada di dalam button
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        if(item ==null){

                          //tambah data
                          item = Item(nameController.text, int.parse(priceController.text),int.parse(stokController.text),merkController.text,tanggalmasukController.text);
                        } else{
                          //ubah data
                          item.merk = merkController.text;
                          item.name = nameController.text;
                          item.stok = int.parse(stokController.text);
                          item.price = int.parse(priceController.text);
                          item.tanggalmasuk= tanggalmasukController.text;
                          
                        }
                        //kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
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



        
  
