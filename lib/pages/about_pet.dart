import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:super_paws/colors/light_mode.dart';
import 'package:super_paws/models/pet.dart';
import 'package:super_paws/pages/owned_pet.dart';
import 'package:super_paws/styles/text_styles.dart';
import 'package:image_fade/image_fade.dart';

class AboutPetPage extends StatefulWidget {
  const AboutPetPage({super.key, required this.pet});
  final Pet pet;

  @override
  State<AboutPetPage> createState() => _AboutPetPageState();
}

class _AboutPetPageState extends State<AboutPetPage> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(
        msg: "Yay! We're as excited as you are. Happy Paw-parenting!");
    FirebaseDatabase.instance
        .ref()
        .child("Ownerships")
        .child(widget.pet.id)
        .set(FirebaseAuth.instance.currentUser!.uid);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => OwnedPetPage(
          pet: widget.pet,
        ),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(msg: "Uh oh! Your payment was unsuccessful");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  int imgCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  imgCount++;
                });
              },
              child: ImageFade(
                image: NetworkImage(
                    widget.pet.images[imgCount % widget.pet.images.length]),
                loadingBuilder: (context, progress, chunkEvent) => Center(
                    child: Image.asset(
                  "assets/gifs/dog_walking.gif",
                  width: 100,
                )),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 1,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: Colors.white),
                    child: ListView(controller: myscrollController, children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.pet.name,
                                  style: textLargePrimary,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.location_city,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.pet.shelterName,
                                    maxLines: 1,
                                    style: textMediumPrimary,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Column(children: [
                            Text(
                              "₹150",
                              style: textLargePrimary,
                            ),
                            Text(
                              "/week",
                              style: textSmallHint,
                            )
                          ]),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
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
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(180, 174, 174, 0.3),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.pet.gender,
                                      style: textMediumPrimaryTheme,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Sex",
                                      style: textSmallHint,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(180, 174, 174, 0.3),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.pet.breed,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: textMediumPrimaryTheme,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Breed",
                                      style: textSmallHint,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(180, 174, 174, 0.3),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${widget.pet.friendliness}",
                                          style: textMediumPrimaryTheme,
                                        ),
                                        Text(
                                          "/5",
                                          style: textSmallHint,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Friendliness",
                                      style: textSmallHint,
                                    )
                                  ],
                                ),
                              ),
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Image.asset(
                            "assets/images/sample_person.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Posted by:",
                                  style: textSmallHint,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Richard Brownie",
                                  style: textMediumPrimarySemiBold,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            "assets/images/circle_call.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            "assets/images/circle_message.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem pellentesque velit donec congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit pellentesque",
                          style: textMediumPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                            onPressed: () {
                              var options = {
                                'key': 'rzp_test_ZIZwADf4j162MO',
                                'amount': 15000,
                                'name': 'Super Paws',
                                'description':
                                    'Adopt your doggo: ${widget.pet.name}',
                                'prefill': {
                                  'contact': '8888888888',
                                  'email': 'test@razorpay.com'
                                }
                              };
                              _razorpay.open(options);
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: LightModeColors.colorPrimary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                padding: EdgeInsets.symmetric(vertical: 16)),
                            child: Text(
                              "Adopt Me",
                              style: textMediumLightBold,
                            )),
                      )
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
