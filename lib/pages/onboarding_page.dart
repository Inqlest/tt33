import 'package:flutter/material.dart';
import 'package:tt33/navigation/routes.dart';
import 'package:tt33/ui_kit/colors.dart';
import 'package:tt33/ui_kit/text_styles.dart';
import 'package:tt33/utils/assets_paths.dart';
import 'package:tt33/utils/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _currentPage = 0;

  Future<void> _nextPage() async {
    if (_currentPage == 2) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      setState(() => _currentPage++);
      await _controller.nextPage(
        duration: AppConstants.duration200,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 148 / 812 * MediaQuery.sizeOf(context).height),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppImages.onBoarding,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'MOOD MONITOR\nAPP',
                                    textAlign: TextAlign.center,
                                    style: AppStyles.bodyLarge
                                        .apply(color: AppColors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 13),
                                ElevatedButton(
                                  onPressed: _nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: AppStyles.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppImages.onBoarding,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Monitor',
                                    textAlign: TextAlign.center,
                                    style: AppStyles.bodyLarge
                                        .apply(color: AppColors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 13),
                                ElevatedButton(
                                  onPressed: _nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: AppStyles.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppImages.onBoarding,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    'Start controling',
                                    textAlign: TextAlign.center,
                                    style: AppStyles.bodyLarge
                                        .apply(color: AppColors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                    SizedBox(width: 6),
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: AppColors.black,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 13),
                                ElevatedButton(
                                  onPressed: _nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.background,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: AppStyles.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 67 / 812 * MediaQuery.sizeOf(context).height),
          ],
        ),
      ),
    );
  }
}
