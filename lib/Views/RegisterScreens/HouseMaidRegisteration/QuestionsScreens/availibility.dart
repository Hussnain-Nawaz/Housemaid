import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/QuestionsScreens/hourlyRate.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();
  int? _selectedTileIndex;

  void _onTileTap(int index) {
    setState(() {
      _selectedTileIndex = _selectedTileIndex == index ? null : index;
    });
  }

  void _selectTime(BuildContext context, String day, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        final formattedTime = picked.format(context);

        switch (day) {
          case 'Monday':
            if (isStartTime) {
              registrationController.mondayStartTime.value = formattedTime;
            } else {
              registrationController.mondayEndTime.value = formattedTime;
            }
            break;
          case 'Tuesday':
            if (isStartTime) {
              registrationController.tuesdayStartTime.value = formattedTime;
            } else {
              registrationController.tuesdayEndTime.value = formattedTime;
            }
            break;
          case 'Wednesday':
            if (isStartTime) {
              registrationController.wednesdayStartTime.value = formattedTime;
            } else {
              registrationController.wednesdayEndTime.value = formattedTime;
            }
            break;
          case 'Thursday':
            if (isStartTime) {
              registrationController.thursdayStartTime.value = formattedTime;
            } else {
              registrationController.thursdayEndTime.value = formattedTime;
            }
            break;
          case 'Friday':
            if (isStartTime) {
              registrationController.fridayStartTime.value = formattedTime;
            } else {
              registrationController.fridayEndTime.value = formattedTime;
            }
            break;
          case 'Saturday':
            if (isStartTime) {
              registrationController.saturdayStartTime.value = formattedTime;
            } else {
              registrationController.saturdayEndTime.value = formattedTime;
            }
            break;
          case 'Sunday':
            if (isStartTime) {
              registrationController.sundayStartTime.value = formattedTime;
            } else {
              registrationController.sundayEndTime.value = formattedTime;
            }
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.04, top: screenHeight * 0.02),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09,
                  height: screenWidth * 0.09,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Text(
                'Select your available hours for each day.',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(7, (index) {
                  return CustomTile(
                    index: index,
                    isSelected: _selectedTileIndex == index,
                    onTap: () => _onTileTap(index),
                    onTimeSelect: (isStartTime) =>
                        _selectTime(context, _getDayName(index), isStartTime),
                    startTime: _getStartTimeForDay(index),
                    endTime: _getEndTimeForDay(index),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 128, 188),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31.5),
                  ),
                  minimumSize: Size(double.infinity, screenHeight * 0.07),
                ),
                onPressed: () {
                  Get.to(() => HourlyRateScreen());
                  // registrationController.submitAllFields(context);
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStartTimeForDay(int index) {
    switch (index) {
      case 0:
        return registrationController.mondayStartTime.value;
      case 1:
        return registrationController.tuesdayStartTime.value;
      case 2:
        return registrationController.wednesdayStartTime.value;
      case 3:
        return registrationController.thursdayStartTime.value;
      case 4:
        return registrationController.fridayStartTime.value;
      case 5:
        return registrationController.saturdayStartTime.value;
      case 6:
        return registrationController.sundayStartTime.value;
      default:
        return '';
    }
  }

  String _getEndTimeForDay(int index) {
    switch (index) {
      case 0:
        return registrationController.mondayEndTime.value;
      case 1:
        return registrationController.tuesdayEndTime.value;
      case 2:
        return registrationController.wednesdayEndTime.value;
      case 3:
        return registrationController.thursdayEndTime.value;
      case 4:
        return registrationController.fridayEndTime.value;
      case 5:
        return registrationController.saturdayEndTime.value;
      case 6:
        return registrationController.sundayEndTime.value;
      default:
        return '';
    }
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }
}

class CustomTile extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final void Function(bool isStartTime) onTimeSelect;
  final String? startTime;
  final String? endTime;

  const CustomTile({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.onTimeSelect,
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          border: Border.all(color: const Color(0xFFDEDEDE)),
          borderRadius: BorderRadius.circular(31.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getDayName(index),
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: screenWidth * 0.06,
                  height: screenWidth * 0.06,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFFFEB0D9), width: 2),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: screenWidth * 0.04,
                            height: screenWidth * 0.04,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFEB0D9),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            if (isSelected)
              Column(
                children: [
                  SizedBox(height: screenWidth * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 241, 128, 188), // Text color
                        ),
                        onPressed: () => onTimeSelect(true),
                        child: Text(
                          startTime != null && startTime!.isNotEmpty
                              ? startTime!
                              : 'Start Time',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 241, 128, 188), // Text color
                        ),
                        onPressed: () => onTimeSelect(false),
                        child: Text(
                          endTime != null && endTime!.isNotEmpty
                              ? endTime!
                              : 'End Time',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }
}
