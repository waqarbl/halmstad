import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halmstad/constants/colors.dart';

class InteractionItem extends StatelessWidget {
  InteractionItem({super.key, this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: double.maxFinite,
      height: 250,
      child: GestureDetector(
        onTap: onTap,
        child: Card.outlined(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: const Text("Headline", style: textStyle14500),
                  subtitle: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: textStyle12400),
                  trailing: const Icon(Icons.more_vert_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Dated: ', style: textStyle14500),
                    Text(
                      '22 Mar 2024',
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Focus Area: ', style: textStyle14500),
                    Text(
                      'Area Name  (Area Type)',
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Total Members: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '5',
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Address: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Lorem ipsum dolor',
                      style: textStyle14500.copyWith(color: greytextColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String text1;
  final String text2;

  TextRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          text2,
          maxLines: 3,
          style: textStyle14500.copyWith(color: greytextColor),
        )
      ],
    );
  }
}
