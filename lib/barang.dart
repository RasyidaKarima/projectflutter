import 'package:flutter/material.dart';
import 'package:project/navigation.dart';

class Barang extends StatefulWidget{
  @override
  BarangState createState() => BarangState();

}
class BarangState extends State<Barang>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//untuk mengatur baground
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
        title: Text("Contoh Barang Gudang "), //membuat text pada appbar
       backgroundColor: Colors.grey,
       ),
       body : GridView.count(//untuk membuat grid pada halaman home
            crossAxisCount: 2,
            children: <Widget>[
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(//untuk membuat 
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://asset.kompas.com/crops/JeC3Wg35NzMvlsbHX3VSIo1Z55k=/64x48:1349x905/750x500/data/photo/2020/07/04/5efffcc704297.jpg'),//menampilkan gambar
                      new Text("Air Jordan"),//untuk menambah text
                      new Text("Rp 5.000.000"),//untuk menambah text
                    ]
                  )
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://asset.kompas.com/crops/myXXxra1T7GVkhYQM4p_ZpduO5I=/120x80:1143x762/750x500/data/photo/2020/12/06/5fcc651543486.jpg'),
                      new Text("Puma"),
                      new Text("Rp 600.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2019/01/17/3991794970.jpg'),
                      new Text("Nike"),
                      new Text("Rp 1.000.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://asset.kompas.com/crops/hZpUdp-3JYDwKjNo4OuuVFsllcY=/0x0:1279x853/750x500/data/photo/2020/11/24/5fbd0561b5282.jpg'),
                      new Text("Adidas"),
                      new Text("Rp 750.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://www.artikelsepatu.com/wp-content/uploads/2018/09/Daftar-Harga-Sepatu-Piero-dan-10-Model-Terbaiknya-4-min.jpg'),
                      new Text("Piero"),
                      new Text("Rp 600.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://img.my-best.id/press_eye_catches/dd7b289148a7b5bab2d7dd0040eee2a6.jpg?ixlib=rails-4.2.0&q=70&lossless=0&w=1400&h=787&fit=crop'),
                      new Text("Skechers"),
                      new Text("Rp 550.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://s2.bukalapak.com/uploads/content_attachment/2321263220e8d762afb3f3c5/w-744/new-balance-574-black-9j5rJ.jpg'),
                      new Text("New Balance"),
                      new Text("Rp 1.500.000"),
                    ],
                  ),
                  ),
                ),
                new Container(
                padding: new EdgeInsets.all(0),
                child: new Card(
                  child: 
                  new Column(
                    children:<Widget>[
                      new Image.network('https://asset.kompas.com/crop/0x0:1000x667/750x500/data/photo/2019/03/05/222295264.jpg'),
                      new Text("Vans"),
                      new Text("Rp 500.000"),
                    ],
                  ),
                  ),
                ),
            ],
            ),
      );
  }
}