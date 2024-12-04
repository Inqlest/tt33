import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt33/bloc/moods_state.dart';
import 'package:tt33/storages/isar.dart';
import 'package:tt33/storages/models/mood.dart';

class MoodsBloc extends Cubit<MoodsState> {
  MoodsBloc() : super(MoodsState(date: DateUtils.dateOnly(DateTime.now())));
  Future<void> getMoods() async {
    final moods = await AppIsarDatabase.getMoods(state.date, state.moodType);
    emit(state.copyWith(moods: moods));
  }

  Future<void> addMood(Mood mood) async {
    await AppIsarDatabase.addMood(mood);
    final updatedMoods = List<Mood>.from(state.moods)..add(mood);
    emit(state.copyWith(moods: updatedMoods));
  }

  Future<void> deleteMood(int id) async {
    await AppIsarDatabase.deleteMood(id);
    final updatedMoods = state.moods.where((mood) => mood.id != id).toList();
    emit(state.copyWith(moods: updatedMoods));
  }

  Future<void> updateMood(int id, Mood newMood) async {
    await AppIsarDatabase.updateMood(id, newMood);
    final updatedMoods = state.moods.map((mood) {
      return mood.id == id ? newMood : mood;
    }).toList();
    emit(state.copyWith(moods: updatedMoods));
  }

  void updatePage(int index) {
    emit(state.copyWith(page: index));
  }

  void updateMoodType(int newMoodType) {
    emit(state.copyWith(moodType: newMoodType));
  }

  void updateDate(DateTime newDate) {
    emit(state.copyWith(date: newDate));
  }
}
