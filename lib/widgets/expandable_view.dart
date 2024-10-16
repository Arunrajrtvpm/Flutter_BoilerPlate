import 'package:flutter/material.dart';

import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';

//This reusable widget provides a collapsible section with a header and expandable content area.
//It's ideal for displaying detailed information that can be hidden or revealed based on user interaction.

class ExpandableView extends StatefulWidget {
  const ExpandableView({
    super.key,
    required this.label,
    required this.expandedView,
    required this.onExpansionChanged,
    required this.icon,
    required this.data,
    required this.imagePath,
  });

  final String label;
  final Widget expandedView;
  final Function(bool isExpanded) onExpansionChanged;
  final IconData icon;
  final String data;
  final String imagePath;

  @override
  ExpandableViewState createState() => ExpandableViewState();
}

class ExpandableViewState extends State<ExpandableView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Set border radius here
      child: Container(
        decoration: const BoxDecoration(
          color:
              LightCodeColors.lightOrange, // Set your desired background color
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                  widget.onExpansionChanged(!_isExpanded);
                },
                children: [
                  ExpansionPanel(
                    backgroundColor: LightCodeColors.lightOrange,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        tileColor: LightCodeColors.lightOrange,
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFF7500),
                            border: Border.all(
                              color: const Color(0xFFFF7500),
                              width: 0.1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset(
                              widget.imagePath,
                              color: Colors.white,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                        title: Text(
                          widget.label,
                          style: TextStyles.textStyle16Black1,
                        ),
                        subtitle: Text(
                          widget.data,
                          style: TextStyles.textStyle14Black1,
                        ),
                      );
                    },
                    body: _isExpanded ? widget.expandedView : Container(),
                    isExpanded: _isExpanded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
