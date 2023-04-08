// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? displayIconUrl;
  final List? backgroundColors;
  final String? backgroundImage;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.displayIconUrl,
    required this.backgroundColors,
    required this.backgroundImage
  });
  factory Character.fromJson(Map<String,dynamic> json){
    return Character(
      id: json["uuid"], 
      name: json["displayName"], 
      description: json["description"], 
      imageUrl: json["fullPortrait"], 
      displayIconUrl: json["displayIcon"],
      backgroundColors: json["backgroundGradientColors"],
      backgroundImage: json["background"]
      );

  }
  
}
