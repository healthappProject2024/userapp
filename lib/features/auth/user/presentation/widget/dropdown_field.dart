import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class CustomDropdownField extends StatefulWidget {
  const CustomDropdownField({super.key});

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue; 
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;

  final List<String> _items = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        height: 53.h,
        width: 315.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: Theme.of(context).indicatorColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Icon(CupertinoIcons.person_2, size: 24.r,color: MyColors.hintTextColor,), // Example gender icon
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  selectedValue ?? 'Choose Gender', 
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: selectedValue == null ? Colors.grey : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Icon(CupertinoIcons.chevron_down, size: 20.r,color: MyColors.hintTextColor,),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      _isDropdownOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height,
        left: offset.dx,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _items
                  .map((item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedValue = item != 'Choose Gender' ? item : null;
                          });
                          _closeDropdown();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 14.sp,color: MyColors.hintTextColor),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
