import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kncha_app/core/platform_widget.dart';

import 'package:google_fonts/google_fonts.dart';

const double _kPickerItemHeight = 32.0;

class PlatformDropdownButton extends PlatformWidget<Widget, Widget> {
  final String? hint;
  final ValueChanged<int> onChanged;
  final List<dynamic> items;
  final int selectedIndex;
  final String? error;
  final TextStyle? style;
  final String? title;
  final bool? showAlert;
  final bool? isExpanded;
  final double? height;
  final double? top;
  final double? buttom;
  final Function? function;

  PlatformDropdownButton({
    required this.onChanged,
    required this.items,
    required this.selectedIndex,
    this.hint,
    this.error,
    this.style,
    this.title,
    this.showAlert = true,
    this.isExpanded = false,
    this.height,
    this.top,
    this.buttom,
    this.function,
  });

  @override
  Widget createAndroidWidget(
    BuildContext context,
  ) {
    return _createWidget(
      context,
      Border.all(
        color: Colors.grey,
      ),
      12.0,
      null,
      showAlert == true
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              _showAlertDialog(context, function!);
            }
          : () {},
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return _createWidget(
      context,
      Border.all(
        color: CupertinoColors.lightBackgroundGray,
        width: 1.0,
      ),
      8.0,
      Colors.white,
      () {
      FocusScope.of(context).requestFocus(FocusNode());
              _showAlertDialog(context, function!);
      },
    );
  }

  Widget _createWidget(BuildContext context, BoxBorder boxBorder,
      double padding, Color? color, GestureTapCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        isExpanded == true
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    title ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  title ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
        SizedBox(height: 4.0),
        InkWell(
          onTap: onTap,
          child: Container(
            height: height ?? 48,
       
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    10.0, top ?? padding, 10.0, buttom ?? padding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        selectedIndex < 0 ? hint ?? '' : items[selectedIndex]!,
                        style: selectedIndex < 0
                            ? Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .apply(color: Color.fromRGBO(0, 0, 0, 0.65))
                            : Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        
        ErrorText(
          error,
        ),
      ],
    );
  }

  _showCupertinoPicker(BuildContext context, Function function) async {
    var scrollController = FixedExtentScrollController(
        initialItem: selectedIndex < 0 ? 0 : selectedIndex);
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          
          actions: items.map((value) {
            return CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);

                function();
              },
              child: Center(
                  child: Text(
                value!,
                style: GoogleFonts.montserrat(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              )),
            );
          }).toList(),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context, Function function) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title ?? '',
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              letterSpacing: 0.15,
            ),
          ),
          content: _builtAlertDialogContent(function),
        );
      },
    );
  }

  Widget _builtAlertDialogContent(Function function) {
    return Container(
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                items[index]!,
                style: GoogleFonts.montserrat(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              onChanged(index);
            },
          );
        },
      ),
    );
  }
}
