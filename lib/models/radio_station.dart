class RadioStation {
  final int? id;
  final String name;
  final String url;
  final bool isFavorite;
  final DateTime addedDate;

  RadioStation({
    this.id,
    required this.name,
    required this.url,
    this.isFavorite = false,
    DateTime? addedDate,
  }) : addedDate = addedDate ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'isFavorite': isFavorite ? 1 : 0,
      'addedDate': addedDate.toIso8601String(),
    };
  }

  factory RadioStation.fromMap(Map<String, dynamic> map) {
    return RadioStation(
      id: map['id'] as int?,
      name: map['name'] as String,
      url: map['url'] as String,
      isFavorite: (map['isFavorite'] as int) == 1,
      addedDate: DateTime.parse(map['addedDate'] as String),
    );
  }

  RadioStation copyWith({
    int? id,
    String? name,
    String? url,
    bool? isFavorite,
    DateTime? addedDate,
  }) {
    return RadioStation(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
      addedDate: addedDate ?? this.addedDate,
    );
  }
}
