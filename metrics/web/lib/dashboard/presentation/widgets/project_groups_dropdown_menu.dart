import 'package:flutter/material.dart';
import 'package:metrics/base/presentation/widgets/dropdown_menu.dart';
import 'package:metrics/dashboard/presentation/state/project_metrics_notifier.dart';
import 'package:metrics/dashboard/presentation/view_models/project_group_dropdown_item_view_model.dart';
import 'package:metrics/dashboard/presentation/widgets/project_groups_dropdown_item.dart';
import 'package:metrics/dashboard/presentation/widgets/project_groups_dropdown_body.dart';
import 'package:provider/provider.dart';

/// A dropdown menu widget providing an ability to select a project group.
class ProjectGroupsDropdownMenu extends StatelessWidget {
  /// A height of the dropdown menu button.
  static const double _menuButtonHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    return Selector<ProjectMetricsNotifier,
        List<ProjectGroupDropdownItemViewModel>>(
      selector: (_, notifier) => notifier.projectGroupDropdownItems,
      builder: (_, items, __) {
        return DropdownMenu<ProjectGroupDropdownItemViewModel>(
          itemHeight: 40.0,
          initiallySelectedItemIndex: 0,
          items: items,
          menuPadding: const EdgeInsets.only(top: _menuButtonHeight),
          menuBuilder: (data) {
            return ProjectGroupsDropdownBody(data: data);
          },
          itemBuilder: (_, item) {
            return ProjectGroupsDropdownItem(
              projectGroupDropdownItemViewModel: item,
            );
          },
          buttonBuilder: (_, item) => Container(
            height: _menuButtonHeight,
            width: 212.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(item?.name ?? ''),
                ),
                Image.network(
                  "icons/dropdown.svg",
                  height: 20.0,
                  width: 20.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}