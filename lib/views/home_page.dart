import 'package:aroom_pro/cubits/category_cubit/cubit/category_cubit.dart';
import 'package:aroom_pro/widgets/custom_search_bar.dart';
import 'package:aroom_pro/widgets/fade_widget.dart';
import 'package:aroom_pro/widgets/home_page_widgets/category_chips.dart';
import 'package:aroom_pro/widgets/home_page_widgets/image_slider.dart';
import 'package:aroom_pro/widgets/product_widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageSlider(),
        const SizedBox(
          height: 16,
        ),
        const CustomSearchBar(),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryInitial) {
              return const Center(
                child: FadeWidget(),
              );
            } else if (state is CategoryLoaded) {
              return CategoryChips(
                  chips: state.categories, onSelected: (value) {});
            } else if (state is CategoryError) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Expanded(
          child: ProductsGridview(),
        ),
      ],
    );
  }
}
