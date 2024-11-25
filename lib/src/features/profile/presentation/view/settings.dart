import 'package:crm_system/src/features/employees/presentation/view/add_employees.dart';
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/common_widget/custumScaffold.dart';
import 'package:crm_system/src/utilities/common_widget/cutomIcon_BTN.dart';
import 'package:crm_system/src/utilities/common_widget/text_field.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static String route ='settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // To track the expanded tile
  final ValueNotifier<Key?> _expandedItem = ValueNotifier<Key?>(null);

  @override
  Widget build(BuildContext context) {
    return CustumScaffold(
      
      body: Expanded(
        child: Padding(
padding: const EdgeInsets.only(
            top: 24.0, right: 24, left: 24, bottom: 16),  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
              alignment: Alignment.topLeft,
              child: CustumIconButton(
                isPrefix: true,
                buttonTItle: "Back to Profile",
                icon: arrowBackSvg,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            16.heightBox,
            // Title
            Text(
              'Settings',
              style: AppTextStyle.boldText(size: 22, color: AppColors.black),
            ),

            
              CustomExpansionTile(
                key: const Key('tile_1'),
                title: Container()
                
                
                ,
                expandedItem: _expandedItem,
                children: [
                  ListTile(
                    title: const Text('Edit Name'),
                    onTap: () => print('Edit Name tapped'),
                  ),
                  ListTile(
                    title: const Text('Change Profile Picture'),
                    onTap: () => print('Change Profile Picture tapped'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
          
            ],
          ),
        ),
      ),
    );
  }
}




const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    this.leading,
    required this.title,
    this.backgroundColor,
    this.children = const <Widget>[],
    this.trailing,
    required this.expandedItem,
    this.padding,
    this.crossAxisAlignment,
  });

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

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

  final ValueNotifier<Key?> expandedItem;

  final EdgeInsets? padding;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

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
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

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
              title: 
              Row(children: [SvgPicture.asset(editSvg),const Text('pass data')],),
              trailing: widget.trailing ??
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more),
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
      child: closed ? null : Column(crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center, children: widget.children),
    );
  }
}





