import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page_template/presentation/shared/main_menu/menu_item_data.dart';

import '../../../application/landing_bloc.dart';

class MenuData {
  static List<MenuItemData> links(BuildContext context) => [
        MenuItemData(
            text: 'home',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(0))),
        MenuItemData(
            text: 'about',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(1))),
        MenuItemData(
            text: 'skills',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(2))),
        MenuItemData(
            text: 'portfolio',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(3))),
        MenuItemData(
            text: 'contact',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(4))),
        MenuItemData(
            text: 'blog',
            onTap: () =>
                BlocProvider.of<LandingBloc>(context).add(PageChanged(5)))
      ];
}
