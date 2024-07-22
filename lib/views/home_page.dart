import 'package:aroom_pro/cubits/category_cubit/cubit/category_cubit.dart';
import 'package:aroom_pro/cubits/product_cubit/cubit/product_cubit.dart';
import 'package:aroom_pro/core/widgets/custom_search_bar.dart';
import 'package:aroom_pro/core/widgets/fade_widget.dart';
import 'package:aroom_pro/widgets/home_page_widgets/category_chips.dart';
import 'package:aroom_pro/widgets/home_page_widgets/image_slider.dart';
import 'package:aroom_pro/core/widgets/loading_widget.dart';
import 'package:aroom_pro/widgets/product_widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory = '';

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
                  chips: state.categories,
                  onSelected: (value) {
                    Future.delayed(Duration.zero, () async {
                      setState(() {
                        selectedCategory = value;
                      });
                    });
                  });
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
          height: 8,
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const LoadingWidget();
            } else if (state is ProductError) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is Productloaded) {
              return Expanded(
                child: ProductsGridview(
                  products: state.products,
                  categoryId: selectedCategory,
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Opps there is an Error, Please try again!',
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
