import 'package:aroom_pro/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips(
      {super.key, required this.chips, required this.onSelected});
  final List<CategoryModel> chips;
  final ValueChanged<String?> onSelected;
  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  late List<bool> selected;

  @override
  void initState() {
    super.initState();
    selected = List<bool>.filled(widget.chips.length, false);
    if (selected.isNotEmpty) {
      selected[0] = true;
      widget.onSelected(widget
          .chips[0].id); // Call the callback function with the first chip's ID
    }
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
                        color: selected.isNotEmpty && selected[index]
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                      )
                    : null,
                elevation: 2,
                selectedColor: Theme.of(context).colorScheme.secondary,
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: selected.isNotEmpty && selected[index]
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
                side: BorderSide(
                  width: 2.5,
                  color: selected.isNotEmpty && selected[index]
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.secondary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                showCheckmark: false,
                label: Row(
                  children: [
                    Text(widget.chips[index].categoryName!),
                  ],
                ),
                selected: selected.isNotEmpty && selected[index],
                onSelected: (bool isSelected) {
                  setState(() {
                    for (int i = 0; i < selected.length; i++) {
                      if (i == index) {
                        selected[i] = isSelected;
                        if (isSelected) {
                          widget.onSelected(
                              widget.chips[i].id); // Call the callback function
                        }
                      } else {
                        widget.onSelected(null);
                        selected[i] = false; // Deselect other chips
                      }
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
