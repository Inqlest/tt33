import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tt33/storages/models/mood.dart';

class MoodState extends Equatable {
  const MoodState({
    this.id,
    this.type = 0,
    required this.date,
    this.comment = '',
    this.reasons,
    this.triggers,
  });

  factory MoodState.fromIsarModel(Mood mood) {
    return MoodState(
      id: mood.id,
      type: mood.type ?? 0,
      date: mood.date ?? DateUtils.dateOnly(DateTime.now()),
      comment: mood.comment ?? '',
      reasons: mood.reasons,
      triggers: mood.triggers,
    );
  }

  final int? id;
  final int type;
  final DateTime date;
  final String comment;
  final List<String>? reasons;
  final List<String>? triggers;
  @override
  List<Object?> get props => [id, type, date, comment, reasons, triggers];

  MoodState copyWith({
    int? id,
    int? type,
    DateTime? date,
    String? comment,
    List<String>? reasons,
    List<String>? triggers,
  }) {
    return MoodState(
      id: id ?? this.id,
      type: type ?? this.type,
      date: date ?? this.date,
      comment: comment ?? this.comment,
      reasons: reasons ?? this.reasons,
      triggers: triggers ?? this.triggers,
    );
  }

  Mood toIsarModel() {
    return Mood()
      ..type = type
      ..date = date
      ..comment = comment
      ..reasons = reasons
      ..triggers = triggers;
  }
}
