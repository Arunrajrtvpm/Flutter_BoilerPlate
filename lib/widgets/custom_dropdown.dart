import 'package:flutter/material.dart';
import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final List<Map<String, String>> options;
  final bool isStatic;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.isStatic,
    this.onChanged,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  late String _selectedOption;
  late List<DropdownMenuItem<String>> _dropdownItems;

  @override
  void initState() {
    super.initState();
    _selectedOption = _getDefaultOption();
    _dropdownItems = _buildDropdownItems();
  }

  String _getDefaultOption() {
    return widget.options.isNotEmpty && widget.options[0]['name'] != null
        ? widget.options[0]['name']!
        : '';
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    Set<String> uniqueValues = {};
    List<DropdownMenuItem<String>> items = [];
    for (Map<String, String> option in widget.options) {
      String name = option['name'] ?? '';
      //String id = option['id'] ?? '';
      if (!uniqueValues.contains(name)) {
        items.add(
          DropdownMenuItem<String>(
            value: name,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyle14,
            ),
          ),
        );
        uniqueValues.add(name);
      }
    }
    return items;
  }

  String? getSelectedId(String selectedName) {
    for (Map<String, String> option in widget.options) {
      String name = option['name'] ?? '';
      String id = option['id'] ?? '';
      if (name == selectedName) {
        return id; // Return the ID of the selected name
      }
    }
    return null; // Return null if the name is not found
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(gapPadding: 0),
          ),
          value: _selectedOption,
          style: TextStyles.textStyle14,
          items: _dropdownItems,
          onChanged: (String? newValue) {
            setState(() {
              if (newValue != null) {
                String? selectedId = getSelectedId(newValue);
                if (selectedId != null) {
                  _selectedOption = newValue;
                  if (widget.onChanged != null) {
                    widget.onChanged!(selectedId);
                  }
                }
              }
            });
          },
          isExpanded: true,
        ),
      ],
    );
  }
}
