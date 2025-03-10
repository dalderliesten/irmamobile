import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irmamobile/src/theme/theme.dart';

class PinBox extends StatelessWidget {
  final double height;
  final EdgeInsets margin;

  final String char;

  final bool disabled;
  final bool completed;
  final bool highlightBorder;

  bool get filled => char != '';

  const PinBox({
    @required this.margin,
    @required this.char,
    this.height = 40.0,
    this.disabled = false,
    this.completed = false,
    this.highlightBorder = false,
  });

  Color getBorderColor(IrmaThemeData theme) {
    if (filled) {
      return theme.grayscale40; // filled boxes
    } else if (highlightBorder) {
      // the box that is currently highlighted
      return theme.primaryBlue;
    } else {
      // empty boxes that are not highlighted
      return theme.grayscale60;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = IrmaTheme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: margin,
      width: height / 4 * 3,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(theme.tinySpacing)),
          border: Border.all(
            color: getBorderColor(theme),
            width: highlightBorder ? 2 : 1,
          ),
          color: disabled ? theme.disabled : theme.grayscaleWhite),
      child: Text(
        char,
        style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: height / 2 + 4,
              height: 22.0 / 18.0,
              color: completed ? theme.primaryBlue : theme.grayscale40,
            ),
      ),
    );
  }
}
