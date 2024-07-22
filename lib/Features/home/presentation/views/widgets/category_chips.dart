import 'package:aroom_pro/Features/category/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({
    super.key,
    required this.chips,
    required this.onSelected,
  });

  final List<CategoryModel> chips;
  final ValueChanged<String?> onSelected;

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int? selectedChipIndex;

  @override
  void initState() {
    super.initState();
    selectedChipIndex = 0; // Select the first chip by default
    widget.onSelected(widget.chips[0].id); // Return the first chip's ID
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          spacing: 5.0,
          runSpacing: 4.0,
          children: List<Widget>.generate(
            widget.chips.length,
            (index) {
              return ChoiceChip(
                avatar: widget.chips[index].icon != null
                    ? Icon(
                        widget.chips[index].icon,
                        size: 22,
                        color: selectedChipIndex == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                      )
                    : null,
                elevation: 2,
                selectedColor: Theme.of(context).colorScheme.primary,
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: selectedChipIndex == index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
                side: BorderSide(
                  width: 2.5,
                  color: selectedChipIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                showCheckmark: false,
                label: Text(widget.chips[index].categoryName!),
                selected: selectedChipIndex == index,
                onSelected: (bool isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedChipIndex = index;
                      widget.onSelected(widget.chips[index].id);
                    } else if (selectedChipIndex == index) {
                      selectedChipIndex = 0;
                      widget.onSelected(widget.chips[0].id);
                    } else {
                      selectedChipIndex = null;
                      widget.onSelected(null);
                    }
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
