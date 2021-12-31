# floating_bottom_nav

![GitHub repo size](https://img.shields.io/github/repo-size/gairick-saha/floating_bottom_nav.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/gairick-saha/floating_bottom_nav.svg)
![GitHub top language](https://img.shields.io/github/languages/top/gairick-saha/floating_bottom_nav.svg)
[![GitHub issues](https://img.shields.io/github/issues/gairick-saha/floating_bottom_nav.svg)](https://github.com/gairick-saha/floating_bottom_nav/issues)
[![GitHub license](https://img.shields.io/github/license/gairick-saha/floating_bottom_nav.svg)](https://github.com/gairick-saha/floating_bottom_nav/blob/master/LICENSE)

**floating_bottom_nav** is a free and open source (MIT license) Material Flutter BottomNavigationBar that supports customization of background color, selectedIconColor, unselectedItemColor also light & dark theme support.

## Get started

Add this to your package's pubspec.yaml file:

```yaml
floating_bottom_nav: '^1.0.0'
```

### **Install it**

You can install packages from the command line:

```
$ flutter pub get
```

Alternatively, your editor might support flutter pub get.

### **Import it**

Now in your Dart code, you can use:

```dart
import 'package:floating_bottom_nav/floating_bottom_nav.dart';

```

## How to use

Adding the widget
* Note: it is recommended that you set the floatingActionButtonLocation to [FloatingActionButtonLocation.centerDocked] 
* Note: it is recommended that you use this widget as the Floadting Action Button

```
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            _selectedIndex,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutQuad,
          );
        },
        items: const [
          Icons.home,
          Icons.explore,
          Icons.favorite,
          Icons.person,
        ],
      ),
```

## Source

Source code and example of this library can be found in git:

```
$ git clone https://github.com/gairick-saha/floating_bottom_nav.git
```
