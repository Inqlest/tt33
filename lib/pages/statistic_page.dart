import 'package:flutter/material.dart';
import 'package:tt33/ui_kit/colors.dart';
import 'package:tt33/ui_kit/text_styles.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Statistic',
            style: AppStyles.displayLarge,
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Month',
              ),
              Icon(Icons.arrow_back_ios_new),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(),
              Container(),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 475,
            child: Container(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: const Column(),
            ),
          ),
        ],
      ),
    );
  }
}
