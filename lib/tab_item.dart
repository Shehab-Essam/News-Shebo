import 'package:flutter/material.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/my_theme.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  TabItem({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 3,
          color: Theme.of(context).primaryColor,
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      child: Text(source.name ?? " ",
          style: isSelected
              ? Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: MyTheme.whiteColor)
              : Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).primaryColor)),
    );
  }
}
