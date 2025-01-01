import 'package:crm_system/src/utilities/colors.dart';
import 'package:flutter/material.dart';

class Customcheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const Customcheckbox(
      {super.key, required this.value, required this.onChanged});

  @override
  State<Customcheckbox> createState() => _CustomcheckboxState();
}

class _CustomcheckboxState extends State<Customcheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures tap events register
      onTap: () {
        //print("Checkbox tapped!");
        widget.onChanged(!widget.value);
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightblack, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: widget.value
            ? const Icon(Icons.check, size: 16, color: Colors.blue)
            : null,
      ),
    );
  }
}
