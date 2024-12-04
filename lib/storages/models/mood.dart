import 'package:isar/isar.dart';

part 'mood.g.dart';

@collection
class Mood {
  Id id = Isar.autoIncrement;

  int? type;
  DateTime? date;
  String? comment;
  List<String>? reasons;
  List<String>? triggers;
}
