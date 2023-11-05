import 'package:flutter/material.dart';
import 'package:super_paws/styles/text_styles.dart';

class PetCard extends StatelessWidget {
  final VoidCallback? onClick;
  String name;
  String gender;
  String address;
  String image;
  PetCard(
      {super.key,
      this.onClick,
      required this.address,
      required this.image,
      required this.name,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onClick ?? () {},
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Image.network(
                  image,
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: textMediumPrimarySemiBold,
                          ),
                        ),
                        Image.asset(
                          gender == "Male"
                              ? "assets/images/male_icon.png"
                              : "assets/images/female_icon.png",
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(children: [
                      Icon(
                        Icons.location_city,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textSmallSemiBold,
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
