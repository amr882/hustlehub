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

  @override
  void initState() {
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

  changePage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void updateUserInfo() {
    userInfo["experience"] = _freelancerExperienceOption;
    userInfo["userGoal"] = _freelancerGoalOption;
    print("$userInfo ++++++++++++++++++");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 6.h, bottom: 2.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                height: 1.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      width: 100.w / 12,
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: children,
                ),
              ),
              CustomButton(
                onTap: () async {
                  changePage();
                },
                title: "Continue",
                width: 80.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
