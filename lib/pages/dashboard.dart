import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_paws/api/pets.dart';
import 'package:super_paws/colors/light_mode.dart';
import 'package:super_paws/models/pet.dart';
import 'package:super_paws/pages/about_pet.dart';
import 'package:super_paws/pages/onboarding.dart';
import 'package:super_paws/pages/widgets/pet_card.dart';
import 'package:super_paws/styles/text_styles.dart';
import 'package:super_paws/utils/loading_dialog.dart';
import 'package:super_paws/widgets/input_field.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseAuth mAuth = FirebaseAuth.instance;
  bool dogsToggle = true;
  bool catsToggle = true;
  bool othersToggle = false;
  List<Pet>? pets;

  @override
  void initState() {
    super.initState();
    loadPets();
  }

  void loadPets() async {
    await Future.delayed(Duration(milliseconds: 100));
    LoadingDialog(context).showLoader(true);
    pets = await getAllPets();
    LoadingDialog(context).cancelLoader();
    print(pets.toString());
    setState(() {});
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset(
                  "assets/images/menu.svg",
                  width: 26,
                  height: 26,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    "Super Paws!",
                    style: textSemiLargePrimary,
                  ),
                ),
                Icon(
                  Icons.notifications_active,
                  size: 26,
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    LoadingDialog(context).showLoader(false);
                    mAuth.signOut().then((value) {
                      Fluttertoast.showToast(msg: "Signed out successfully!");
                      LoadingDialog(context).cancelLoader();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingPage()),
                          (route) => false);
                    });
                  },
                  child: Icon(
                    Icons.account_circle,
                    size: 26,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  MyInputField(
                    onChanged: (value) {},
                    label: "Search",
                    verticalPadding: 16,
                    borderRadius: 12,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: double.infinity,
                        width: 45,
                        decoration: BoxDecoration(
                          color: LightModeColors.colorSecondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4.5,
              decoration: BoxDecoration(
                color: LightModeColors.colorSecondary,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          "assets/images/bubbles.png",
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Join the revolution, own a pet today!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Adopt Now",
                              style: textSmallPrimarySemiBold,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/woman_with_cat.png",
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 26,
                ),
                Text(
                  "Pet Categories",
                  style: textMediumPrimarySemiBold,
                ),
                Spacer(),
                Text(
                  "More",
                  style: textMediumPrimary,
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dogsToggle = !dogsToggle;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                            color:
                                !dogsToggle ? Colors.grey : Colors.transparent),
                        color: dogsToggle
                            ? LightModeColors.colorSecondary
                            : Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          "assets/images/dog_icon.png",
                          width: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Text(
                            "Dogs",
                            style: dogsToggle
                                ? textSmallLightSemiBold
                                : textSmallSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      catsToggle = !catsToggle;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                            color:
                                !catsToggle ? Colors.grey : Colors.transparent),
                        color: catsToggle
                            ? LightModeColors.colorSecondary
                            : Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          "assets/images/cat_icon.png",
                          width: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Text(
                            "Cats",
                            style: catsToggle
                                ? textSmallLightSemiBold
                                : textSmallSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      othersToggle = !othersToggle;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                            color: !othersToggle
                                ? Colors.grey
                                : Colors.transparent),
                        color: othersToggle
                            ? LightModeColors.colorSecondary
                            : Colors.white),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          "assets/images/turtle_icon.png",
                          width: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Text(
                            "Others",
                            style: othersToggle
                                ? textSmallLightSemiBold
                                : textSmallSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 26,
                ),
                Text(
                  "Adopt Pets",
                  style: textMediumPrimarySemiBold,
                ),
                Spacer(),
                Text(
                  "See all",
                  style: textMediumPrimary,
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16,
                  );
                },
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var pet = pets![index];
                  return PetCard(
                    name: pet.name,
                    address: pet.shelterAddress,
                    gender: pet.gender,
                    image: pet.images[0],
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => AboutPetPage(pet: pet)));
                    },
                  );
                },
                itemCount: (pets ?? []).length,
                // children: [
                //   PetCard(
                //     onClick: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => AboutPetPage()));
                //     },
                //   ),
                //   const SizedBox(
                //     width: 16,
                //   ),
                //   PetCard(),
                //   const SizedBox(
                //     width: 16,
                //   ),
                //   PetCard(),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
