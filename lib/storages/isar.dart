import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tt33/storages/models/mood.dart';

abstract class AppIsarDatabase {
  static late final Isar _instance;

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return _instance = await Isar.open(
      [MoodSchema],
      directory: dir.path,
    );
  }

  static Future<List<Mood>> getMoods(DateTime date, int type) async {
    return await _instance.moods
        .filter()
        .typeEqualTo(type)
        .and()
        .dateEqualTo(date)
        .findAll();
  }

  static Future<void> addMood(Mood mood) async {
    await _instance.writeTxn(() async => await _instance.moods.put(mood));
  }

  static Future<void> deleteMood(int id) async {
    await _instance.writeTxn(() async => await _instance.moods.delete(id));
  }

  static Future<void> updateMood(int id, Mood newMood) async {
    await _instance.writeTxn(() async {
      final mood = await _instance.moods.get(id);
      if (mood != null) {
        mood
          ..type = newMood.type
          ..date = newMood.date;
        await _instance.moods.put(mood);
      }
    });
  }

  static Future<List<Mood>> getAllMoods() async {
    return await _instance.moods.where().findAll();
  }
}
