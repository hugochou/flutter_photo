import 'package:flutter/material.dart' hide CheckboxListTile;
import 'package:photo/src/entity/options.dart';
import 'package:photo/src/provider/i18n_provider.dart';
import 'package:photo/src/ui/widget/check_tile_copy.dart';

abstract class CheckBoxBuilderDelegate {
  Widget buildCheckBox(
    BuildContext context,
    bool checked,
    int index,
    Options options,
    I18nProvider i18nProvider,
  );
}

class DefaultCheckBoxBuilderDelegate extends CheckBoxBuilderDelegate {
  Color activeColor;
  Color unselectedColor;
  Color checkColor;

  DefaultCheckBoxBuilderDelegate({
    this.activeColor = Colors.white,
    this.unselectedColor = Colors.white,
    this.checkColor = Colors.black,
  });

  @override
  Widget buildCheckBox(
    BuildContext context,
    bool checked,
    int index,
    Options options,
    I18nProvider i18nProvider,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: unselectedColor),
      child: CheckboxListTile(
        value: checked,
        onChanged: (bool check) {},
        activeColor: activeColor,
        checkColor: checkColor,
        title: Text(
          i18nProvider.getSelectedOptionsText(options),
          textAlign: TextAlign.end,
          style: TextStyle(color: options.textColor),
        ),
      ),
    );
  }
}

class RadioCheckBoxBuilderDelegate extends CheckBoxBuilderDelegate {
  Color activeColor;
  Color unselectedColor;

  RadioCheckBoxBuilderDelegate({
    this.activeColor = Colors.white,
    this.unselectedColor = Colors.white,
  });

  @override
  Widget buildCheckBox(
    BuildContext context,
    bool checked,
    int index,
    Options options,
    I18nProvider i18nProvider,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(unselectedWidgetColor: unselectedColor),
      child: RadioListTile<bool>(
        value: true,
        onChanged: (bool check) {},
        activeColor: activeColor,
        title: Text(
          i18nProvider.getSelectedOptionsText(options),
          textAlign: TextAlign.end,
          style: TextStyle(color: options.textColor, fontSize: 14.0),
        ),
        groupValue: checked,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}

class CustomCheckBoxBuilderDelegate extends CheckBoxBuilderDelegate {
  Color selectedColor; // 选中的背景色
  Color unselectedColor; // 未选中的背景色

  CustomCheckBoxBuilderDelegate({
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.white,
  });

  @override
  Widget buildCheckBox(
    BuildContext context,
    bool checked,
    int index,
    Options options,
    I18nProvider i18nProvider,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: checked ? selectedColor : unselectedColor,
            border: Border.all(color: checked ? unselectedColor : selectedColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Center(child: Icon(Icons.check, size: 16, color: unselectedColor)),
        ),
      ),
    );
  }
}
