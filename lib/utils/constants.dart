import 'package:flutter/material.dart';
import 'package:tt33/ui_kit/colors.dart';
// import 'package:tt33/utils/assets_paths.dart';

abstract class AppConstants {
  static const isFirstRun = "isFirstRun";
  static const exerciseTypes = ['meditation', 'practice'];
  static const pages = [
    (Icon(Icons.home), AppColors.black),
    (Icon(Icons.home), AppColors.red),
    (Icon(Icons.home), AppColors.purple),
    (Icon(Icons.home), AppColors.green),
  ];
  static const moodsType = [
    (AppColors.yellow, 'Happy'),
    (AppColors.purple, 'Sad'),
    (AppColors.red, 'Angry'),
    (AppColors.green, 'Anxiety'),
  ];
  static const duration200 = Duration(milliseconds: 200);
  static const breathingExercises = {
    '4-7-8 Breathing Technique': {
      'steps': [
        '1. Sit or lie down in a comfortable position.',
        '2. Close your eyes and relax your shoulders.',
        '3. Inhale through your nose for a count of 4 seconds.',
        '4. Hold your breath for 7 seconds.',
        '5. Exhale slowly through your mouth for 8 seconds.',
        '6. Repeat this cycle 4–6 times. This exercise can help slow your heart rate and calm your nervous system.',
      ],
    },
    'Diaphragmatic Breathing (Belly Breathing)': {
      'steps': [
        '1. Sit or lie down in a comfortable position, placing one hand on your chest and the other on your belly.',
        '2. Relax your shoulders and close your eyes if it helps you focus.',
        '3. Inhale deeply through your nose, ensuring your belly rises while your chest remains still. Count to 4 as you inhale.',
        '4. Exhale slowly through your mouth, allowing your belly to fall. Count to 6 as you exhale.',
        '5. Repeat this cycle for 5–10 minutes. This exercise promotes relaxation, improves oxygen flow, and reduces stress.',
      ],
    },
    'Box Breathing (Square Breathing)': {
      'steps': [
        '1. Sit in a relaxed position with your back straight and your hands resting on your knees or lap.',
        '2. Close your eyes and inhale deeply through your nose for 4 seconds.',
        '3. Hold your breath for 4 seconds.',
        '4. Exhale slowly through your mouth for 4 seconds.',
        '5. Hold your breath again for 4 seconds.',
        '6. Repeat this cycle 4–6 times. This exercise helps enhance focus, calm the mind, and regulate breathing patterns.',
      ],
    },
  };
  static const meditationExercises = {
    'Seated Forward Bend': {
      'steps': [
        '1. Sit on the floor with your legs extended straight in front of you.',
        '2. Inhale and lengthen your spine, reaching your arms overhead.',
        '3. Exhale as you fold forward, reaching for your feet or ankles.',
        '4. Relax your head and neck, and hold the pose for 20–30 seconds.',
        '5. Slowly return to an upright position.',
      ],
    },
    'Child’s Pose (Yoga)': {
      'steps': [
        '1. Kneel on the floor and sit back on your heels.',
        '2. Extend your arms forward and lower your torso onto your thighs.',
        '3. Rest your forehead on the mat and relax your shoulders.',
        '4. Breathe deeply, holding the pose for 20–30 seconds.',
        '5. Slowly come back to a kneeling position.',
      ],
    },
    'Supine Twist': {
      'steps': [
        '1. Lie on your back with your legs extended straight.',
        '2. Bend your right knee and bring it across your body to the left.',
        '3. Extend your right arm to the side and gaze toward your right hand.',
        '4. Hold the twist for 20–30 seconds, then return to the center.',
        '5. Repeat on the other side.',
      ],
    },
  };
}
