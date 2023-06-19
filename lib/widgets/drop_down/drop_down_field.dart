import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/widgets/drop_down/drop_down_overlay.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({
    super.key,
    required this.placeholder,
    required this.items,
    required this.selecteElement,
    required this.onChange,
    required this.isError,
    this.height = 44,
    this.isFixSizeDropDown = true,
  });

  final String placeholder;
  final List<String> items;
  final String selecteElement;
  final Function(String, int) onChange;
  final double height;
  final bool isError;
  final bool isFixSizeDropDown;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  OverlayEntry? entry;
  late LayerLink layerLink;

  @override
  void initState() {
    super.initState();
    layerLink = LayerLink();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (_) {
        if (mounted) {
          return DropdownOverlay(
            items: widget.items,
            size: size,
            layerLink: layerLink,
            hideOverlay: hideOverlay,
            placeholder: widget.placeholder,
            selecteElement: widget.selecteElement,
            height: widget.height,
            onChange: (value, index) {
              widget.onChange.call(value, index);
            },
            isFixSizeDropDown: widget.isFixSizeDropDown,
          );
        }
        return const SizedBox();
      },
    );
    Overlay.of(context).insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    return CompositedTransformTarget(
      link: layerLink,
      child: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          showOverlay();
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: theme.lightBlue, width: 2),
          ),
          height: 44,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.selecteElement,
                        style: theme.h1,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrowDown.svg',
                        color: theme.blue,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
