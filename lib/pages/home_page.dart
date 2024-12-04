import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt33/bloc/moods_bloc.dart';
import 'package:tt33/bloc/moods_state.dart';
import 'package:tt33/pages/exercises_page.dart';
import 'package:tt33/pages/main_page.dart';
import 'package:tt33/pages/settings_page.dart';
import 'package:tt33/pages/statistic_page.dart';
import 'package:tt33/ui_kit/colors.dart';
import 'package:tt33/ui_kit/text_styles.dart';
import 'package:tt33/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MoodsBloc, MoodsState, int>(
      selector: (state) => state.page,
      builder: (context, page) => Scaffold(
        appBar: switch (page) {
          0 => AppBar(
              title: const Text(
                'Main',
                style: AppStyles.displaySmall,
              ),
            ),
          1 => AppBar(
              title: const Row(
                children: [
                  Text(
                    'Statistics',
                    style: AppStyles.displaySmall,
                  ),
                ],
              ),
            ),
          2 => AppBar(
              title: const Row(
                children: [
                  Text(
                    'Exercises',
                    style: AppStyles.displaySmall,
                  ),
                ],
              ),
            ),
          _ => AppBar(
              title: const Text('Settings', style: AppStyles.displaySmall),
              centerTitle: true,
            ),
        },
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: page,
                children: const [
                  MainPage(),
                  ExercisesPage(),
                  StatisticPage(),
                  SettingsPage(),
                ],
              ),
            ),
            Positioned(
              bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  AppConstants.pages.length,
                  (index) => GestureDetector(
                    onTap: () => context.read<MoodsBloc>().updatePage(index),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: page == index
                            ? AppConstants.pages[index].$2
                            : AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(.05),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      duration: AppConstants.duration200,
                      child: Stack(
                        children: [
                          // SvgPicture.asset(
                          //   AppConstants.pages[index].$1,
                          //   colorFilter: ColorFilter.mode(
                          //     AppColors.onPrimary,
                          //     BlendMode.srcIn,
                          //   ),
                          // ),
                          AnimatedOpacity(
                            opacity: page == index ? 1 : 0,
                            duration: AppConstants.duration200,
                            // child: SvgPicture.asset(
                            //   AppConstants.pages[index].$1,
                            //   colorFilter: const ColorFilter.mode(
                            //     AppColors.surface,
                            //     BlendMode.srcIn,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
