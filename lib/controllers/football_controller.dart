import 'package:get/get.dart';

class Player {
  String profileImage;
  String name;
  String position;
  int number;

  Player({
    required this.profileImage,
    required this.name,
    required this.position,
    required this.number,
  });

  Player copyWith({
    String? profileImage,
    String? name,
    String? position,
    int? number,
  }) {
    return Player(
      profileImage: profileImage ?? this.profileImage,
      name: name ?? this.name,
      position: position ?? this.position,
      number: number ?? this.number,
    );
  }
}

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      profileImage: 'asset/doku.jpg',
      name: 'Jeremy Doku',
      position: 'LWF',
      number: 11,
    ),
    Player(
      profileImage: 'asset/halan.jpg',
      name: 'Erling Haaland',
      position: 'CF',
      number: 9,
    ),
    Player(
      profileImage: 'asset/foden.jpg',
      name: 'Phill Foden',
      position: 'SS',
      number: 47,
    ),
  ].obs;
}
