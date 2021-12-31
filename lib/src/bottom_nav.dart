import 'package:flutter/material.dart';

class FloatingBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double? width;
  final double? bottomPadding;
  final double? elevation;
  final double? radius;
  final Color backgroundColor;
  final Color darkThemeBackgroundColor;
  final Color? selectedItemColor;
  final Color darkThemeselectedItemColor;
  final Color? unselectedItemColor;
  final Color darkThemeUnselectedItemColor;
  final List<IconData> items;
  final double iconSize;

  const FloatingBottomNavBar({
    Key? key,
    required this.onTap,
    this.currentIndex = 0,
    this.width,
    this.bottomPadding = 16,
    this.elevation = 3,
    this.radius,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.darkThemeBackgroundColor = const Color(0xFF292929),
    this.selectedItemColor = const Color(0xFF111111),
    this.darkThemeselectedItemColor = const Color(0xFFEFEFEF),
    this.unselectedItemColor = const Color(0xFF767676),
    this.darkThemeUnselectedItemColor = const Color(0xFF767676),
    required this.items,
    this.iconSize = 28,
  })  : assert(items.length >= 2, 'Minium 2 items need to specify.'),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  @override
  _FloatingBottomNavBarState createState() => _FloatingBottomNavBarState();
}

class _FloatingBottomNavBarState extends State<FloatingBottomNavBar> {
  late int _selectedIndex;
  bool hovering = false;
  int hoveringItemIndex = -1;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FloatingBottomNavBar oldWidget) {
    if (oldWidget.currentIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = oldWidget.currentIndex;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final ThemeData _theme = Theme.of(context);
    final Brightness brightness = _theme.brightness;
    final BottomNavigationBarThemeData theme = _theme.bottomNavigationBarTheme;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: widget.width,
          child: Material(
            elevation: widget.elevation ??
                theme.elevation ??
                _theme.floatingActionButtonTheme.elevation ??
                3,
            color: brightness == Brightness.light
                ? theme.backgroundColor ?? widget.backgroundColor
                : theme.backgroundColor ?? widget.darkThemeBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(widget.radius ?? _size.width * 1),
            ),
            clipBehavior: Clip.hardEdge,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: brightness == Brightness.light
                    ? theme.backgroundColor ?? widget.backgroundColor
                    : theme.backgroundColor ?? widget.darkThemeBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, .5),
                    blurRadius: .1,
                    spreadRadius: .05,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.items.length,
                  (int index) => InkWell(
                    onTap: () => widget.onTap(index),
                    onHover: (h) {
                      setState(() {
                        hovering = h;
                        hoveringItemIndex = index;
                      });
                    },
                    child: SizedBox.square(
                      dimension: widget.iconSize * 2,
                      child: Icon(
                        widget.items[index],
                        size: hovering
                            ? hoveringItemIndex == index
                                ? widget.iconSize * 1.4
                                : widget.iconSize
                            : widget.iconSize,
                        color: widget.currentIndex == index
                            ? brightness == Brightness.light
                                ? theme.selectedItemColor ??
                                    widget.selectedItemColor
                                : theme.selectedItemColor ??
                                    widget.darkThemeselectedItemColor
                            : brightness == Brightness.light
                                ? theme.unselectedItemColor ??
                                    widget.unselectedItemColor
                                : theme.unselectedItemColor ??
                                    widget.darkThemeUnselectedItemColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
