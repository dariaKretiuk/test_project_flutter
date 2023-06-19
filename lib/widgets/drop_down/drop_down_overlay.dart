import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_flutter/helpers/constans/app_theme.dart';
import 'package:test_project_flutter/widgets/drop_down/animation_section.dart';

class DropdownOverlay extends StatefulWidget {
  const DropdownOverlay({
    Key? key,
    required this.items,
    required this.size,
    required this.layerLink,
    required this.hideOverlay,
    required this.placeholder,
    required this.selecteElement,
    required this.onChange,
    required this.height,
    this.isFixSizeDropDown = true,
  }) : super(key: key);

  final List<String> items;
  final Size size;
  final LayerLink layerLink;
  final VoidCallback hideOverlay;
  final String placeholder;
  final String selecteElement;
  final Function(String, int) onChange;
  final double height;
  final bool isFixSizeDropDown;

  @override
  State<DropdownOverlay> createState() => _DropdownOverlayState();
}

class _DropdownOverlayState extends State<DropdownOverlay> {
  bool displayOverly = true;
  bool displayOverlayBottom = true;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.lightThemeData();
    final child = GestureDetector(
      onTap: () => setState(() => displayOverly = false),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              color: theme.blue.withOpacity(0.7),
            ),
            Positioned(
              width: widget.size.width + 24,
              child: CompositedTransformFollower(
                link: widget.layerLink,
                followerAnchor: displayOverlayBottom ? Alignment.topLeft : Alignment.bottomLeft,
                showWhenUnlinked: false,
                offset: Offset(-12, displayOverlayBottom ? 0 : 60),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: theme.blue,
                        width: 1,
                      ),
                      color: theme.white,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: AnimatedSection(
                        animationDismissed: widget.hideOverlay,
                        expand: displayOverly,
                        axisAlignment: displayOverlayBottom ? 1.0 : -1.0,
                        child: SizedBox(
                          height: _heightDropDown(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: widget.height,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.selecteElement.isNotEmpty ? widget.selecteElement : widget.placeholder,
                                          style: theme.h1.copyWith(color: widget.selecteElement.isNotEmpty ? theme.black : theme.lightBlue),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      SvgPicture.asset(
                                        displayOverlayBottom ? 'assets/icons/arrowUp.svg' : 'assets/icons/arrowDown.svg',
                                        color: theme.blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: theme.lightBlue,
                                height: 1,
                              ),
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Scrollbar(
                                    thumbVisibility: true,
                                    controller: scrollController,
                                    child: ListView.builder(
                                      controller: scrollController,
                                      padding: EdgeInsets.zero,
                                      itemCount: widget.items.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            widget.onChange(widget.items[index], index);
                                            setState(() {
                                              displayOverly = false;
                                            });
                                          },
                                          child: Container(
                                              height: widget.height,
                                              decoration: widget.items[index] == widget.selecteElement
                                                  ? BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(
                                                        color: theme.blue,
                                                        width: 1,
                                                      ),
                                                      color: theme.blue.withOpacity(0.2),
                                                    )
                                                  : null,
                                              child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                                    child: Text(
                                                      widget.items[index],
                                                      style: theme.p1.copyWith(color: theme.black),
                                                    ),
                                                  ))),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () => setState(() => displayOverly = false),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: child,
      ),
    );
  }

  double _heightDropDown() {
    if (widget.isFixSizeDropDown) {
      return (widget.items.length + 1) > 4 ? 5 * widget.height : (widget.items.length + 1) * widget.height;
    }
    return (widget.items.length + 1) * widget.height;
  }
}
