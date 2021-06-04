class Item1{
  int _id;
  String _name;
  String _merk;
  String _reseller;
  String _tanggalkeluar;
  int _jumlah;

  int get id => _id;

  String get name => this._name;
  set name(String value) =>this._name= value;


  String get merk => this._merk;
  set merk(String value) =>this._merk= value;

  String get reseller => this._reseller;
  set reseller(String value) =>this._reseller= value;

  String get tanggalkeluar => this._tanggalkeluar;
  set tanggalkeluar(String value) =>this._tanggalkeluar = value;

  get jumlah =>this._jumlah;
  set jumlah (value)=> this._jumlah=value;

  // konstruktor versi 1
  Item1(this._name,this._merk,this._reseller, this._tanggalkeluar,this._jumlah);

  //konstruktor versi 2: konversi dari Map ke Item
  Item1.fromMap(Map<String,dynamic> map){
    this._id= map['id'];
    this._name = map['name'];
    this._merk= map['merk'];
    this._reseller = map['reseller'];
    this._tanggalkeluar = map['tanggalkeluar'];
    this._jumlah = map['jumlah'];
  }
  // konversi dari Item ke Map
  Map <String,dynamic> toMap(){
    Map <String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name']= name;
    map['merk'] = merk;
    map['reseller'] = reseller;
    map['tanggalkeluar'] = tanggalkeluar;
    map['jumlah'] = jumlah;


    return map;
  }
}