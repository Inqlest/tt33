import 'package:equatable/equatable.dart';
import 'package:tt33/storages/models/mood.dart';

class MoodsState extends Equatable {
  const MoodsState({
    this.moods = const [],
    this.page = 0,
    this.moodType = 0,
    required this.date,
  });

  final List<Mood> moods;
  final int page;
  final int moodType;
  final DateTime date;

  @override
  List<Object?> get props => [
        moods,
        page,
        moodType,
        date,
      ];

  MoodsState copyWith({
    List<Mood>? moods,
    int? page,
    int? moodType,
    DateTime? date,
  }) {
    return MoodsState(
      moods: moods ?? this.moods,
      page: page ?? this.page,
      moodType: moodType ?? this.moodType,
      date: date ?? this.date,
    );
  }
}
