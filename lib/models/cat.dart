import 'package:meta/meta.dart';

class Cat {
  final int externalId;
  final String name;
  final String description;
  final String location;
  final String avatarUrl;
  final int likeCounter;
  final bool adopted;
  final List<String> pictures;
  final List<String> cattributes;

  Cat(
      {@required this.externalId,
      @required this.name,
      @required this.description,
      @required this.location,
      @required this.avatarUrl,
      @required this.likeCounter,
      @required this.adopted,
      @required this.pictures,
      @required this.cattributes});

  @override
  String toString() {
    return 'Cat $externalId is named $name';
  }
}
