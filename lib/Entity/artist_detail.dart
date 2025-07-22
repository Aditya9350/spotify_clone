class ArtistDetails {
  String? name;
  String? image;
  bool? isNetwork;

  ArtistDetails({this.name, this.image, this.isNetwork});

  factory ArtistDetails.formJson(Map<String, dynamic> json) {
    return ArtistDetails(
      name: json['name'],
      image: json['image'],
      isNetwork: json['isNetwork'],
    );
  }
}
