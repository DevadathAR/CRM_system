
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    this.leading,
    this.backgroundColor,
    this.children = const <Widget>[],
    this.trailing,
    required this.expandedItem,
    this.padding,
    required this.label,
    this.crossAxisAlignment,
    required this.icon,
  });

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  final Color? backgroundColor;

  /// A widget to display instead of a rotating arrow icon.
  final Widget? trailing;

  // Alignment of children in column
  final CrossAxisAlignment? crossAxisAlignment;

  final String label;

  final String icon;

  final ValueNotifier<Key?> expandedItem;

  final EdgeInsets? padding;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = widget.expandedItem.value == widget.key;
    if (_isExpanded) _controller.value = 1.0;

    widget.expandedItem.addListener(listener);
  }

  void listener() {
    setState(() {
      _changeState(widget.expandedItem.value == widget.key);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.expandedItem.removeListener(listener);
    super.dispose();
  }

  void _changeState(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
  }

  void _handleTap() {
    _changeState(!_isExpanded);
    widget.expandedItem.value = _isExpanded ? widget.key : const ValueKey(-1);
  }
Widget _buildChildren(BuildContext context, Widget? child) {
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    // Determine colors based on expansion state
    final Color iconColor = _isExpanded ? AppColors.blue : AppColors.textGrey1;
    final Color textColor = _isExpanded ? AppColors.blue : AppColors.textGrey1;
    final Color arrowColor = _isExpanded ? AppColors.blue : AppColors.textGrey1;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
              contentPadding: widget.padding ?? EdgeInsets.zero,
              onTap: _handleTap,
              leading: widget.leading,
              title: Row(
                children: [
                  SvgPicture.asset(
                    widget.icon,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                  16.widthBox,
                  Text(
                    widget.label,
                    style: AppTextStyle.semiboldText(
                      size: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              trailing: widget.trailing ??
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.expand_more,
                      color: arrowColor, // Arrow color changes dynamically
                    ),
                  ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }


  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    // _borderColorTween.end = theme.dividerColor;
    _borderColorTween.end = Colors.transparent;
    _headerColorTween
      ..begin = theme.textTheme.titleMedium?.color
      ..end = theme.colorScheme.secondary;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.colorScheme.secondary;
    _backgroundColorTween.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Column(
              crossAxisAlignment:
                  widget.crossAxisAlignment ?? CrossAxisAlignment.center,
              children: widget.children),
    );
  }
}
