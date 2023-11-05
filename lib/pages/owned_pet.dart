import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:super_paws/colors/light_mode.dart';
import 'package:super_paws/models/pet.dart';
import 'package:super_paws/styles/text_styles.dart';

class OwnedPetPage extends StatefulWidget {
  final Pet pet;
  const OwnedPetPage({super.key, required this.pet});

  @override
  State<OwnedPetPage> createState() => _OwnedPetPageState();
}

class _OwnedPetPageState extends State<OwnedPetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.black54,
            Colors.black,
          ], radius: 0.25)),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          widget.pet.name,
                          style: textLargeLightBold,
                        ),
                        Text(
                          "${widget.pet.shelterName}",
                          style: textSmallLight,
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: LightModeColors.colorPrimary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.video_call,
                                    size: 26,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Video call",
                                    style: textMediumLight,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 26,
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: LightModeColors.colorPrimary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.video_file,
                                    size: 26,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "View Feed",
                                    textAlign: TextAlign.center,
                                    style: textMediumLight,
                                  )),
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: LightModeColors.colorPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/dog-food.png",
                                      width: 26,
                                      height: 26,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Send treats!",
                                  style: textSmallLight,
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: LightModeColors.colorPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.vaccines,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Vaccination",
                                    style: textSmallLight,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: LightModeColors.colorPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.shopping_bag,
                                      size: 26,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Shop",
                                  style: textSmallLight,
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: LightModeColors.colorPrimary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.toys,
                                      size: 26,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Toys",
                                  style: textSmallLight,
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            const Text(
                              "View in AR >",
                              style: textSmallLight,
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ModelViewer(
                src: "assets/images/dogo.glb",
                ar: true,
                autoRotate: true,
                disableZoom: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
