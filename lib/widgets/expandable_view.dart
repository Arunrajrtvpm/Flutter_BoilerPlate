import 'package:flutter/material.dart';
import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';

class ExpandableView extends StatefulWidget {
  const ExpandableView({
    super.key,
    required this.label,
    required this.expandedView,
    required this.onExpansionChanged,
    required this.icon,
    required this.data,
  });

  final String label;
  final Widget expandedView;
  final Function(bool isExpanded) onExpansionChanged;
  final IconData icon;
  final String data;

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
          color: lightOrange, // Set your desired background color
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
                    backgroundColor: lightOrange,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        tileColor: lightOrange,
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
                              'assets/images/logo.png',
                              // Replace with your image asset path
                              color: Colors.white,
                              // Optional: Apply color to the image (if needed)
                              width: 18,
                              // Set the width of the image
                              height: 18, // Set the height of the image
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
