class Item{
  int _id;
  String _name;
  int _price;
  int _stok;
  String _merk;
  String _tanggalmasuk;

  int get id => _id;

  String get name => this._name;
  set name(String value) =>this._name= value;

  get price => this._price;
  set price(value) => this._price = value;

  get stok =>this._stok;
  set stok (value)=> this._stok=value;

  String get merk => this._merk;
  set merk(String value) =>this._merk= value;

  String get tanggalmasuk => this._tanggalmasuk;
  set tanggalmasuk(String value) =>this._tanggalmasuk= value;

  // konstruktor versi 1
  Item(this._name,this._price,this._stok,this._merk, this._tanggalmasuk);

  //konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String,dynamic> map){
    this._id= map['id'];
    this._name = map['name'];
    this._price = map['price'];
    this._stok = map['stok'];
    this._merk= map['merk'];
    this._tanggalmasuk= map['tanggalmasuk'];
    
  }
  // konversi dari Item ke Map
  Map <String,dynamic> toMap(){
    Map <String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name']= name;
    map['price'] = price;
    map['stok'] = stok;
    map['merk'] = merk;
    map['tanggalmasuk'] = tanggalmasuk;

    return map;
  }
}