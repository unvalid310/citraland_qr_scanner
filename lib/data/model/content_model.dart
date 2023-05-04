class ContentModel {
  String _judul;
  String _image;
  String _description;
  String _subdescription;
  String _fasilitasText;
  String _mapsLink;

  ContentModel(
    String judul,
    String image,
    String description,
    String subdescription,
    String fasilitasText,
    String mapsLink,
  ) {
    this._judul = judul;
    this._image = image;
    this._description = description;
    this._subdescription = subdescription;
    this._fasilitasText = fasilitasText;
    this._mapsLink = mapsLink;
  }

  String get judul => _judul;
  String get image => _image;
  String get description => _description;
  String get subdescription => _subdescription;
  String get fasilitasText => _fasilitasText;
  String get mapsLink => _mapsLink;

  ContentModel.fromJson(Map<String, dynamic> json) {
    _judul = json['judul'];
    _image = json['image'];
    _description = json['description'];
    _subdescription = json['subdescription'];
    _fasilitasText = json['fasilitas_text'];
    _mapsLink = json['maps_link'];
  }
}
