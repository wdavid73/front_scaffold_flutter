import 'package:flutter/material.dart';
import 'package:front_scaffold_flutter/ui/managers/color_manager.dart';
import 'package:gap/gap.dart';

class SnackBarManager {
  static void showSnackBar(BuildContext context,
      {String? message,
      SnackBarAction? action,
      Widget? customContent,
      IconData? icon,
      Color? colorIcon}) {
    assert((customContent == null && message != null) ||
        (customContent != null && message == null));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: customContent ??
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: 30,
                        color: colorIcon ?? ColorManager.error,
                      )
                    : const SizedBox.shrink(),
                Gap(icon != null ? 10 : 0),
                Flexible(
                  child: Text("$message"),
                ),
              ],
            ),
        action: action,
      ),
    );
  }
}
