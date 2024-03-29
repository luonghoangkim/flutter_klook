import 'package:apptest/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnchorTabPanell extends StatefulWidget {
  final List<Widget> tabs;

  final List<Widget> body;

  final Duration animationDuration;

  final Curve animationCurve;

  final ScrollController? scrollController;

  final double tabHeight;

  final double selectedTabHeight;

  final bool rebuildBody;

  const AnchorTabPanell({
    required this.tabs,
    required this.body,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.animationCurve = Curves.ease,
    this.scrollController,
    this.rebuildBody = true,
    this.tabHeight = 35,
    this.selectedTabHeight = 40,
    super.key,
  }) : assert(tabs.length == body.length);

  @override
  _AnchorTabPanelState createState() => _AnchorTabPanelState();
}

class _AnchorTabPanelState extends State<AnchorTabPanell> {
  late List<GlobalKey?> keysTabs;

  late List<GlobalKey?> keysBody;

  Widget? bodyWidget;

  List<double>? visibility;

  int selectedTab = 0;

  DateTime ensureVisibleTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    keysTabs = List.generate(widget.tabs.length, (index) => null);

    final double screenWidth = MediaQuery.of(context).size.width;

    final Widget tabsWidget = createTabsWidget();

    final List<Widget> blocks = [];

    // Create the body widgets just once
    // as the set state is just to to control the selected tab
    if (visibility == null ||
        visibility!.length != widget.tabs.length ||
        widget.rebuildBody) {
      visibility = List.generate(widget.tabs.length, (index) => 0);
      keysBody = List.generate(widget.body.length, (index) => null);
      for (int i = 0; i < widget.body.length; i++) {
        final Widget widgetMapKey = widget.tabs[i];
        final Widget targetWiget = widget.body[i];
        blocks.add(generateBlock(i, widgetMapKey, screenWidth, targetWiget));
      }

      bodyWidget = Expanded(
        child: SingleChildScrollView(
          controller: widget.scrollController ?? ScrollController(),
          child: Column(
            children: blocks,
          ),
        ),
      );
    }

    final Column result = Column(
      children: [
        tabsWidget,
        bodyWidget!,
      ],
    );

    return result;
  }

  Widget createTabsWidget() {
    final List<Widget> tabsItems = [];

    for (int i = 0; i < widget.tabs.length; i++) {
      final Widget widgetMapKey = widget.tabs[i];
      final GlobalKey tabKey = GlobalKey(debugLabel: 'tab $i');
      keysTabs[i] = tabKey;

      tabsItems.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: selectedTab == i
                          ? AppColors.primaryColor
                          : AppColors.whiteColor),
                )),
                child: MaterialButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    key: tabKey,
                    height: selectedTab == i
                        ? widget.selectedTabHeight
                        : widget.tabHeight,
                    // color: selectedTab == i
                    //     ? Theme.of(context).colorScheme.secondary
                    //     : Theme.of(context).cardColor,
                    child: widgetMapKey,
                    onPressed: () {
                      scrollToWidgetWithKey(keysBody[i]!);
                      if (mounted) {
                        setState(() {
                          selectedTab = i;
                        });
                      }
                    }),
              ),
            ],
          ),
        ),
      );
    }

    final Widget tabsWidget = Container(
      margin: const EdgeInsets.all(5),
      height: widget.selectedTabHeight + 10,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tabsItems,
      ),
    );

    return tabsWidget;
  }

  Widget generateBlock(
      int index, Widget widgetMapKey, double screenWidth, Widget targetWidget) {
    final GlobalKey key = GlobalKey(debugLabel: 'block$index');
    keysBody[index] = key;

    return VisibilityDetector(
        key: key,
        onVisibilityChanged: (visibilityInfo) {
          final visiblePercentage = visibilityInfo.visibleFraction * 100;
          visibility![index] = visiblePercentage;
          final int currentIndex = lastVisibleIndex(visibility!);

          final bool validIndex = currentIndex >= 0;
          final bool changedTab = selectedTab != currentIndex;
          final bool isVisible = visiblePercentage > 0;
          if (validIndex && changedTab && isVisible) {
            if (mounted) {
              if (DateTime.now()
                  .isBefore(ensureVisibleTime.add(widget.animationDuration))) {
                return;
              }

              setState(
                () {
                  selectedTab = currentIndex;
                  scrollToWidgetWithKey(keysTabs[currentIndex]!);
                },
              );
            }
          }
        },
        child: targetWidget);
  }

  void scrollToWidgetWithKey(GlobalKey key) {
    if (key.currentContext != null) {
      ensureVisibleTime = DateTime.now();
      Scrollable.ensureVisible(key.currentContext!,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  static int lastVisibleIndex(List<double> visibility) {
    const int lastIndex = -1;

    if (visibility[0] > 0) {
      return 0;
    } else if (visibility[visibility.length - 1] > 0) {
      return visibility.length - 1;
    }

    for (int i = 1; i < visibility.length - 1; i++) {
      if (visibility[i] > 0) {
        return i;
      }
    }

    return lastIndex;
  }
}
