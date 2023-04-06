import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !Platform.isIOS) {
      return createAndroidWidget(context);
    }
    return createIosWidget(context);
  }
}

class ErrorText extends StatefulWidget {
  final String? error;

  ErrorText(this.error);

  @override
  _ErrorTextState createState() => _ErrorTextState();
}

class _ErrorTextState extends State<ErrorText>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: widget.error == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.error!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .apply(color: Theme.of(context).errorColor),
                maxLines: 3,
              ),
            ),
    );
  }
}

const double _kPickerContainerHeight = 271.0;
const double _kPickerSheetHeight = 216.0;

Widget buildBottomPicker(BuildContext context, Widget picker) {
  return SizedBox.fromSize(
    size: Size(double.infinity, _kPickerContainerHeight),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: CupertinoColors.white,
          child: Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Container(
          height: _kPickerSheetHeight,
          padding: const EdgeInsets.only(top: 0.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
