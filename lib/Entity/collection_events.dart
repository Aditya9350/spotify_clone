class CollectionEvents {
  String? event_type;
  String? image;
  String? color;


  CollectionEvents({this.event_type, this.image, this.color});

  factory CollectionEvents.fromJson(Map<String, dynamic> json) {
    return CollectionEvents(
      event_type: json['event_type'],
      image: json['image'],
      color: json['color']

    );
  }
}