import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/gen/assets.gen.dart';

enum HomeNavItem { home, diagnose, myGarden, profile }

extension HomeNavItemX on HomeNavItem {
  int get index => switch (this) {
    HomeNavItem.home => 0,
    HomeNavItem.diagnose => 1,
    HomeNavItem.myGarden => 2,
    HomeNavItem.profile => 3,
  };

  static HomeNavItem fromIndex(int index) => switch (index) {
    0 => HomeNavItem.home,
    1 => HomeNavItem.diagnose,
    2 => HomeNavItem.myGarden,
    3 => HomeNavItem.profile,
    _ => HomeNavItem.home,
  };
}

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    required this.currentItem,
    required this.onItemSelected,
    super.key,
  });

  final HomeNavItem currentItem;
  final ValueChanged<HomeNavItem> onItemSelected;

  static const _inactiveAlpha = 0.55;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 1, color: colors.subText.withValues(alpha: 0.12)),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentItem.index,
          onTap: (index) => onItemSelected(HomeNavItemX.fromIndex(index)),
          backgroundColor: colors.surface,
          elevation: 0,
          selectedItemColor: colors.primary,
          unselectedItemColor: colors.subText.withValues(alpha: _inactiveAlpha),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 2,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 2,
          ),
          items: [
            _item(
              icon: Assets.icons.home.home,
              label: t.home.navHome,
              colors: colors,
            ),
            _item(
              icon: Assets.icons.home.diagnose,
              label: t.home.navDiagnose,
              colors: colors,
            ),
            _item(
              icon: Assets.icons.home.myGarden,
              label: t.home.navMyGarden,
              colors: colors,
            ),
            _item(
              icon: Assets.icons.home.profile,
              label: t.home.navProfile,
              colors: colors,
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBarItem _item({
    required SvgGenImage icon,
    required String label,
    required AppColors colors,
  }) {
    return BottomNavigationBarItem(
      icon: _NavIcon(
        icon: icon,
        color: colors.subText.withValues(alpha: _inactiveAlpha),
      ),
      activeIcon: _NavIcon(icon: icon, color: colors.primary),
      label: label,
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, required this.color});

  final SvgGenImage icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: icon.svg(
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}

class HomeScanFab extends StatelessWidget {
  const HomeScanFab({required this.onPressed, super.key});

  final VoidCallback onPressed;

  static const _innerColor = Color(0xFF28AF6E);
  static const _borderColor = Color(0xFF2CCC80);

  static const _size = 64.0;
  static const _iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: _innerColor,
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(
          side: BorderSide(color: _borderColor, width: 3),
        ),
        child: Assets.icons.home.scan.svg(
          width: _iconSize,
          height: _iconSize,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
