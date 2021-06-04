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
        title: Text("Barang"), //membuat text pada appbar
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),//menampilkan gambar
                      new Text("Converse"),//untuk menambah text
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Air Jordan"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Nike"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Adidas"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Puma"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Ardiles"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Vans"),
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
                      new Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.roomme.id%2Ffashion-beauty%2F4-fakta-seputar-sepatu-air-jordan-dior-yang-perlu-kamu-ketahui%2F&psig=AOvVaw0VBL3xUH5KwW3S6wHEwr3i&ust=1622882227168000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjD8cvJ_fACFQAAAAAdAAAAABAD'),
                      new Text("Reebook"),
                    ],
                  ),
                  ),
                ),
            ],
            ),
      );
  }
}