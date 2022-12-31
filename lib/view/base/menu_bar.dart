import 'package:flutter/material.dart';
import 'package:flutter_grocery/helper/route_helper.dart';
import 'package:flutter_grocery/localization/language_constrants.dart';
import 'package:flutter_grocery/provider/auth_provider.dart';
import 'package:flutter_grocery/view/base/mars_menu_bar.dart';
import 'package:provider/provider.dart';
class MenuBar extends StatelessWidget {
  List<MenuItems> getMenus(BuildContext context) {
    final bool _isLoggedIn = Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
    return [
      MenuItems(
        title: getTranslated('home', context),
        icon: Icons.home_filled,
       onTap: () => Navigator.pushNamed(context, RouteHelper.menu)
      ),
      MenuItems(
        title: getTranslated('all_categories', context),
        icon: Icons.category,
        onTap: () => Navigator.pushNamed(context, RouteHelper.categorys),
      ),

      MenuItems(
        title: getTranslated('useful_links', context),
        icon: Icons.settings,
        children: [
          MenuItems(
            title: getTranslated('privacy_policy', context),
            onTap: () => Navigator.pushNamed(context, RouteHelper.getPolicyRoute()),
          ),
          MenuItems(
            title: getTranslated('terms_and_condition', context),
            onTap: () => Navigator.pushNamed(context, RouteHelper.getTermsRoute()),
          ),
          MenuItems(
            title: getTranslated('about_us', context),
            onTap: () => Navigator.pushNamed(context, RouteHelper.getAboutUsRoute()),
          ),

        ],
      ),


      MenuItems(
        title: getTranslated('search', context),
        icon: Icons.search,
        onTap: () =>  Navigator.pushNamed(context, RouteHelper.searchProduct),
      ),

      MenuItems(
        title: getTranslated('menu', context),
        icon: Icons.menu,
        onTap: () => Navigator.pushNamed(context, RouteHelper.profileMenus),
      ),


      _isLoggedIn ?  MenuItems(
        title: getTranslated('profile', context),
        icon: Icons.person,
       onTap: () => Navigator.pushNamed(context, RouteHelper.profile),
      ):  MenuItems(
        title: getTranslated('login', context),
        icon: Icons.lock,
        onTap: () => Navigator.pushNamed(context, RouteHelper.login),
      ),
      MenuItems(
        title: '',
        icon: Icons.shopping_cart,
         onTap: () => Navigator.pushNamed(context, RouteHelper.cart),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {

    return Container(
    width: 800,
      child: PlutoMenuBar(
        backgroundColor: Theme.of(context).cardColor,
        gradient: false,
        goBackButtonText: 'Back',
        textStyle: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
        moreIconColor: Theme.of(context).textTheme.bodyText1.color,
        menuIconColor: Theme.of(context).textTheme.bodyText1.color,
        menus: getMenus(context),

      ),
    );
  }
}