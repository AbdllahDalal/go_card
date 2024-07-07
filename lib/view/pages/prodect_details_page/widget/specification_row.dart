import 'package:dream_store_app/controller/prodect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/constants.dart';
import '../../../widget/share_compont/custom_text.dart';

class SpecificationRow extends StatefulWidget {
  const SpecificationRow(
      {super.key,
      required this.title,
      required this.typeColors,
      required this.options,
      required this.rowWidth});
  final List options;
  final String title;
  final bool typeColors;
  final double rowWidth;
  @override
  State<SpecificationRow> createState() => _SpecificationRowState();
}

class _SpecificationRowState extends State<SpecificationRow> {
  late int selected = 0;
  final ProdectController _prodectController = Get.find();
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text("${widget.title} :",
                style: const TextStyle(color: Constants.kGranTextColor)),
          ),
          Expanded(
            child: SizedBox(
              // width: widget.rowWidth,
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (widget.typeColors) {
                            _prodectController.changeColorIndex(index);
                            _prodectController.goToPage(index);
                            // _prodectController.selectSpecifications[title] =
                            //     options[index];
                          } else {
                            setState(() {
                              selected = index;
                            });
                            // selected = index;
                            // _prodectController.selectSpecifications[widget]
                            _prodectController
                                    .selectSpecifications[widget.title] =
                                widget.options[index];
                          }
                        },
                        child: widget.typeColors
                            ? Obx(
                                () => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  padding: const EdgeInsets.all(3),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    // color: Constants.kGranTextColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: _prodectController
                                                    .prodectColorIndex ==
                                                index
                                            ? widget.options[index]
                                            : Colors.transparent),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 5,
                                          spreadRadius: 4)
                                    ],
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: widget.options[index])),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selected == index
                                        ? Constants.kGoldColor
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: selected == index
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primaryContainer
                                      : Colors.transparent,
                                ),
                                child: customText(
                                    text: "${widget.options[index]}",
                                    fontColor: _theme.colorScheme.primary),
                              ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
