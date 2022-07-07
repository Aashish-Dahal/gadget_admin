import 'package:admin_panel/core/utils/constants.dart';
import 'package:flutter/material.dart'
    show
        Axis,
        BorderRadius,
        BorderSide,
        BoxConstraints,
        BuildContext,
        Color,
        Colors,
        EdgeInsets,
        Flex,
        GestureTapCallback,
        Icon,
        Key,
        MainAxisSize,
        Radius,
        RawMaterialButton,
        RoundedRectangleBorder,
        SizedBox,
        StatelessWidget,
        TextStyle,
        Theme,
        Widget;
import '../../config/themes/app_colors.dart';

enum ButtonType { filled, outlined, transparent }

enum ButtonSize {
  small,
  medium,
  large,
}

class Button extends StatelessWidget {
  final GestureTapCallback onPressed;
  final ButtonSize? size;
  final ButtonType? type;
  final Widget child;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final TextStyle? textStyle;
  final bool? disabled;
  final EdgeInsets? padding;
  final double? width;
  final Color? fillColor;
  final bool disableBorder;
  final Axis direction;

  final BorderRadius? borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  Button({
    Key? key,
    required this.onPressed,
    required this.child,
    this.trailingIcon,
    this.leadingIcon,
    this.disabled = false,
    this.disableBorder = false,
    this.textStyle,
    this.width,
    this.size = ButtonSize.large,
    this.type = ButtonType.filled,
    this.padding,
    this.borderRadius,
    this.fillColor,
    this.direction = Axis.horizontal,
    this.splashColor,
    this.highlightColor,
  }) : super(key: key);
  final Map<ButtonSize, double> sizeVale = {
    ButtonSize.small: 8,
    ButtonSize.medium: 12,
    ButtonSize.large: 16,
  };

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: disabled! ? null : onPressed,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      constraints: BoxConstraints(minWidth: width ?? 0, minHeight: 0.0),
      padding: EdgeInsets.symmetric(
              vertical: sizeVale[size] ?? 0,
              horizontal: (sizeVale[size] ?? 0) * 2)
          .merge(padding),
      textStyle: (size == ButtonSize.large
              ? Theme.of(context).textTheme.button
              : size == ButtonSize.medium
                  ? Theme.of(context).textTheme.subtitle2
                  : Theme.of(context).textTheme.bodyText2)
          ?.merge(textStyle)
          .merge(
            TextStyle(
              color: disabled!
                  ? Colors.white
                  : type == ButtonType.filled
                      ? Colors.white
                      : Theme.of(context).primaryColor,
            ),
          ),
      highlightColor: highlightColor,
      splashColor: (splashColor ??
          (fillColor != null
              ? fillColor?.withAlpha(127)
              : (type == ButtonType.filled
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).primaryColorLight))),
      fillColor: disabled!
          ? AppColors.greyDark
          : type == ButtonType.filled
              ? fillColor ?? Theme.of(context).primaryColor
              : null,
      shape: RoundedRectangleBorder(
        side: disabled! || type != ButtonType.outlined
            ? BorderSide.none
            : BorderSide(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(disableBorder ? 8 : 8),
            ),
      ),
      child: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: direction,
        children: [
          ...(leadingIcon != null
              ? [leadingIcon!, const SizedBox(width: 8)]
              : []),
          child,
          ...(trailingIcon != null
              ? [
                  const SizedBox(
                    width: 8,
                  ),
                  trailingIcon!
                ]
              : [])
        ],
      ),
    );
  }
}
