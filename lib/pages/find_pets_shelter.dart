import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:super_paws/colors/light_mode.dart';
import 'package:super_paws/styles/text_styles.dart';

class FindPetsAndSheltersPage extends StatefulWidget {
  const FindPetsAndSheltersPage({super.key});

  @override
  State<FindPetsAndSheltersPage> createState() =>
      _FindPetsAndSheltersPageState();
}

class _FindPetsAndSheltersPageState extends State<FindPetsAndSheltersPage> {
  bool dogsToggle = true;
  bool catsToggle = true;
  bool othersToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Text(
              "Search For A Pet",
              style: textLargePrimaryTheme,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: TextEditingController(),
              style: textMediumPrimary,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: textMediumHint,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              onChanged: (text) {},
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          dogsToggle = !dogsToggle;
                        });
                      },
                      child: SimpleShadow(
                        sigma: 5,
                        color: dogsToggle
                            ? LightModeColors.colorPrimaryLight
                            : Colors.grey,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: dogsToggle
                                ? LightModeColors.colorPrimaryLight
                                : Colors.grey.shade300,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.pets,
                                size: 26,
                                color: dogsToggle ? Colors.white : Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Dogs",
                                style: dogsToggle
                                    ? textSmallLightSemiBold
                                    : textSmallSemiBold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          catsToggle = !catsToggle;
                        });
                      },
                      child: SimpleShadow(
                        sigma: 5,
                        color: catsToggle
                            ? LightModeColors.colorPrimaryLight
                            : Colors.grey,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: catsToggle
                                ? LightModeColors.colorPrimaryLight
                                : Colors.grey.shade300,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.pets,
                                size: 26,
                                color: catsToggle ? Colors.white : Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Cats",
                                style: catsToggle
                                    ? textSmallLightSemiBold
                                    : textSmallSemiBold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          othersToggle = !othersToggle;
                        });
                      },
                      child: SimpleShadow(
                        sigma: 5,
                        color: othersToggle
                            ? LightModeColors.colorPrimaryLight
                            : Colors.grey,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: othersToggle
                                ? LightModeColors.colorPrimaryLight
                                : Colors.grey.shade300,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.snapchat,
                                size: 26,
                                color:
                                    othersToggle ? Colors.white : Colors.black,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Other Animals",
                                textAlign: TextAlign.center,
                                style: othersToggle
                                    ? textSmallLightSemiBold
                                    : textSmallSemiBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
