import 'dart:developer';

import 'package:eap_student/Widgets/custom_button.dart';
import 'package:eap_student/constants/const.dart';
import 'package:eap_student/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/providers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool selected = false;

  final List<String> _titles = ["Class", "Subject", "Book", "Chapter", "Topic"];

  void _nextPage() {
    if (_currentPage < _titles.length - 1) {
      // Provider.of<OurProviderClass>(context,listen: false).changeCurrentPageForGeneratePaperWizard(_currentPage+1);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      // Provider.of<OurProviderClass>(context,listen: false).changeCurrentPageForGeneratePaperWizard(_currentPage-1);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 20.0;
    double availableWidth =
        MediaQuery.of(context).size.width - (horizontalPadding * 2);

    double stepWidth = availableWidth / _titles.length;
    double capsuleWidth = stepWidth * 0.95;

    return PopScope(
      canPop: _currentPage == 0,
      onPopInvokedWithResult: (bool didPop, result) async {
        log("Current PAge");
        log(_currentPage.toString());
        log(didPop.toString());
        if (!didPop && _currentPage > 0) {
          _previousPage();
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(1.0),
            height: 18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomAppColors.bluelightToFF6905,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: stepWidth * _currentPage,
                  child: Container(
                    width: capsuleWidth,
                    height: 16,
                    decoration: BoxDecoration(
                      color: CustomAppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Tabs text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _titles
                .asMap()
                .map(
                  (i, title) => MapEntry(
                    i,
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: CustomTextStyles.text16GreyW600.copyWith(

                            color: i <= _currentPage
                                ? CustomAppColors.primaryToWhite
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
          const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(1.0),
            height: 18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: stepWidth * _currentPage,
                  child: Container(
                    width: capsuleWidth,
                    height: 16,
                    decoration: BoxDecoration(
                      color: CustomAppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _titles.asMap().entries.map((entry) {
                    int i = entry.key;
                    return Transform.translate(
                      offset: Offset(
                        i == 0
                            ? 27
                            : i == 1
                            ? 14
                            : i == 2
                            ? 0
                            : i == 3
                            ? -15
                            : -28,
                        2,
                      ),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == _currentPage
                              ? CustomAppColors
                                    .whiteColor // active
                              : CustomAppColors.primaryColor, // inactive
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Tabs text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _titles.asMap().entries.map((entry) {
              final i = entry.key;
              final title = entry.value;

              if (i == _currentPage) {
                // Selected step with triangle
                return Column(
                  children: [
                    CustomPaint(
                      painter: TrianglePainter(
                        color: CustomAppColors.primaryColor,
                      ),
                      child: Container(height: 8, width: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: CustomAppColors.primaryColor,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }).toList(),
          ),
          const SizedBox(height: 16),
          // PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _titles.length,
              itemBuilder: (context, index) {
                return _buildPage(_titles[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select your $title", style: CustomTextStyles.text20DarkLight700),
        const SizedBox(height: 4),
        Text(
          "Choose a $title to continue",
          style: CustomTextStyles.text16Grey73ToC0600,
        ),

        const SizedBox(height: 20),
        if (index == 3)
          Column(children: [selectionContainer("Physical World")])
        else
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: classContainer("class")
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: classContainer("class")
                  ),
                ],
              ),
            ],
          ),

        const Spacer(),

        if (index > 0)
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton.icon(
              onPressed: _previousPage,
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back"),
            ),
          ),
      ],
    );
  }
  Widget classContainer(String title){
    return GestureDetector(
      onTap: _nextPage,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomAppColors.greyF7To2E,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomTextStyles.text16DarkLight600,
            ),
            Container(
              alignment: Alignment.center,
              width: 28,
              height: 28,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: CustomAppColors.greyD9To4C,
              ),
              child: Icon(
                Icons.arrow_outward,
                size: 20,
                color: CustomAppColors.grey73ToC0,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget selectionContainer(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: CustomAppColors.greyF7To2E,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CustomRadio(selected: selected,onTap:(){setState(() {
            selected = !selected;});}),
          SizedBox(width: 20,),
          Radio<bool>(
            innerRadius: WidgetStatePropertyAll(4.0),
            side: BorderSide(width: 1.5,color:CustomAppColors.grey_a0a0a0),
              value: selected,
              overlayColor: MaterialStateProperty.all(Colors.transparent), // no ripple overlay
              splashRadius: 16,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return CustomAppColors.primaryColor; // filled when selected
                }
                return Colors.transparent; // no fill when unselected
              }),
               onChanged: (value) {
            setState(() {
              selected = !selected;});
          }),
          Text(title, style: CustomTextStyles.text16DarkLightW500),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width / 2, 0) // top center
      ..lineTo(0, size.height) // bottom left
      ..lineTo(size.width, size.height) // bottom right
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class CustomRadio extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const CustomRadio({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: selected
                ? CustomAppColors.primaryColor
                : CustomAppColors.grey_a0a0a0,
          ),
          color: selected ? CustomAppColors.primaryColor : Colors.transparent,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: selected ? 8 : 0,
            height: selected ? 8 : 0,
            decoration: BoxDecoration(
              color: CustomAppColors.whiteColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

