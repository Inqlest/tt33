import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tt33/ui_kit/colors.dart';
import 'package:tt33/ui_kit/text_styles.dart';
import 'package:tt33/utils/constants.dart';

//TODO поменять иконки
class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 64),
          const Text('Exercises', style: AppStyles.displayLarge),
          const SizedBox(height: 30),
          const Text('Breathing exercises', style: AppStyles.displaySmall),
          const SizedBox(height: 15),
          ...AppConstants.breathingExercises.entries.map((entry) {
            final title = entry.key;
            final steps = entry.value['steps']!;
            return Column(
              children: [
                _ExercisesBox(
                  exercise: AppConstants.exerciseTypes[0],
                  title: title,
                  steps: steps,
                ),
                const SizedBox(height: 10),
              ],
            );
          }),
          const SizedBox(height: 10),
          const Text('Meditation exercises', style: AppStyles.displaySmall),
          const SizedBox(height: 15),
          ...AppConstants.meditationExercises.entries.map((entry) {
            final title = entry.key;
            final steps = entry.value['steps']!;
            return Column(
              children: [
                _ExercisesBox(
                  exercise: AppConstants.exerciseTypes[0],
                  title: title,
                  steps: steps,
                ),
                const SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ExercisesBox extends StatefulWidget {
  final String exercise;
  final String title;
  final List<String> steps;

  const _ExercisesBox({
    required this.exercise,
    required this.title,
    required this.steps,
  });

  @override
  State<_ExercisesBox> createState() => _ExercisesBoxState();
}

class _ExercisesBoxState extends State<_ExercisesBox> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        height: isExpanded ? 335 : 44,
        width: MediaQuery.sizeOf(context).width,
        duration: AppConstants.duration200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style:
                        AppStyles.bodyMedium.copyWith(color: AppColors.white),
                  ),
                  Icon(
                    isExpanded ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                    color: AppColors.white,
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    widget.steps.join('\n'),
                    style:
                        AppStyles.bodyMedium.copyWith(color: AppColors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 36,
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.primary),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _PracticePage(
                            title: widget.title,
                            steps: widget.steps,
                          ),
                        ),
                      ),
                      child: Text(
                        'Start ${widget.exercise}',
                        style: AppStyles.displayMedium
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PracticePage extends StatefulWidget {
  final String title;
  final List<String> steps;

  const _PracticePage({
    required this.title,
    required this.steps,
  });

  @override
  State<_PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<_PracticePage> {
  int totalTimeInSeconds = 60;
  int currentTime = 60;
  Timer? timer;
  bool isRunning = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void toggleTimer() {
    if (isRunning) {
      timer?.cancel();
      setState(() {
        isRunning = false;
      });
    } else {
      setState(() {
        isRunning = true;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (currentTime > 0) {
          setState(() {
            currentTime--;
          });
        } else {
          timer.cancel();
          setState(() {
            isRunning = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double progress = currentTime / totalTimeInSeconds;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 64),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Expanded(
                    child: Text(
                      'Practice',
                      textAlign: TextAlign.center,
                      style: AppStyles.displayMedium,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        widget.title,
                        style: AppStyles.displayMedium
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(height: 25),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 220,
                            width: 220,
                            child: CircularProgressIndicator(
                              value: 1 - progress,
                              strokeWidth: 20,
                              backgroundColor: AppColors.white,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.black,
                              ),
                            ),
                          ),
                          Text(
                            "${(currentTime ~/ 60).toString().padLeft(2, '0')}:${(currentTime % 60).toString().padLeft(2, '0')}",
                            style: AppStyles.displayLarge
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Take each step for one minute',
                        style: AppStyles.bodyMedium
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        widget.steps.join('\n'),
                        style: AppStyles.bodyMedium
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 75),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: toggleTimer,
                  style: ButtonStyle(
                    backgroundColor: isRunning
                        ? WidgetStateProperty.all(AppColors.red)
                        : WidgetStateProperty.all(AppColors.primary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    isRunning ? "Stop" : "Start",
                    style: AppStyles.displayMedium
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
