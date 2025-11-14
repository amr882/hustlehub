import 'package:flutter/material.dart';
import 'package:hustlehub/features/core/widgets/custom_button.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_db.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/user_info/experience.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/user_info/work_role.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/user_info/your_goal.dart';
import 'package:sizer/sizer.dart';

class FreelancerSetupPage extends StatefulWidget {
  const FreelancerSetupPage({super.key});

  @override
  State<FreelancerSetupPage> createState() => _FreelancerSetupAccountState();
}

class _FreelancerSetupAccountState extends State<FreelancerSetupPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  String _freelancerExperienceOption = levelOtions[0];
  String _freelancerGoalOption = goalOtions[0];
  Map userInfo = {};
  late final List<Widget> children;

  @override
  void initState() {
    children = [
      UserExperience(
        selectedExperience: _freelancerExperienceOption,
        experienceValue: (value) {
          setState(() {
            _freelancerExperienceOption = value.toString();
            updateUserInfo();
          });
        },
      ),
      YourGoal(
        selectedGoal: _freelancerGoalOption,
        goalValue: (value) {
          setState(() {
            _freelancerGoalOption = value.toString();
            updateUserInfo();
          });
        },
      ),
      WorkRole(),
    ];

    freelancerDb();
    updateUserInfo();
    super.initState();

    _pageController.addListener(_updateCurrentPage);
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage);
    _pageController.dispose();
    super.dispose();
  }

  void _updateCurrentPage() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  freelancerDb() async {
    await FreelancerDb().addFreelancer();
  }

  void nextPage() {
    if (_currentPage < children.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      _completeSetup();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeSetup() {
    print("Setup Complete! Final Data: $userInfo");
  }

  void updateUserInfo() {
    userInfo["experience"] = _freelancerExperienceOption;
    userInfo["userGoal"] = _freelancerGoalOption;
    print("$userInfo ++++++++++++++++++");
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPage == children.length - 1;
    String buttonTitle = isLastPage ? "Complete Setup" : "Continue";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 6.h, bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                height: 1.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: children.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      width: 100.w / (children.length + 2),
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? Colors.green
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              if (_currentPage > 0)
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: previousPage,
                  ),
                ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: children,
                ),
              ),
              CustomButton(onTap: nextPage, title: buttonTitle, width: 80.w),
            ],
          ),
        ),
      ),
    );
  }
}
