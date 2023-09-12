import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/settings_controller.dart';
import '../../core/constants/color.dart';
import '../../core/constants/imgaeasset.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2.8,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.grey,
                  backgroundImage: AssetImage(AppImageAsset.avatar),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Column(children: [
              ...List.generate(
                  controller.settingsList.length,
                  (index) =>
                      GetBuilder<SettingsControllerImp>(builder: (logic) {
                        return ListTile(
                          onTap: logic.settingsList[index]['onTap'],
                          title: Text(logic.settingsList[index]['title']),
                          trailing: index != 0
                              ? logic.settingsList[index]['trailing']
                              : Switch(
                                  onChanged: (val) {
                                    logic.changeSwitchVal(val);
                                  },
                                  value: logic.switchValue),
                        );
                      }))
            ]),
          ),
        )
      ],
    );
  }
}
