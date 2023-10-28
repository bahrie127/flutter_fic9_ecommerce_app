import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/cart/cart_page.dart';

import '../../common/components/search_input.dart';
import '../../common/components/spaces.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import '../cart/bloc/cart/cart_bloc.dart';
import 'bloc/products/products_bloc.dart';
import 'widgets/category_button.dart';
import 'widgets/image_slider.dart';
import 'widgets/product_card.dart';
import 'widgets/product_model.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final List<ProductModel> products = [
    ProductModel(
      images: [Images.product1],
      name: 'Tas Kekinian',
      price: 200000,
    ),
    ProductModel(
      images: [Images.product2],
      name: 'Earphone',
      price: 199999,
    ),
    ProductModel(
      images: [Images.product3],
      name: 'Sepatu Pria',
      price: 700000,
    ),
    ProductModel(
      images: [Images.product4],
      name: 'Earphone',
      price: 670000,
    ),
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
      Images.recomendedProductBanner,
    ];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(20.0),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: ColorName.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Sleman, DI Yogyakarta",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorName.primary,
                        ),
                      ),
                      SpaceWidth(5.0),
                      Icon(
                        Icons.expand_more,
                        size: 18.0,
                        color: ColorName.primary,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  badges.Badge(
                    badgeContent: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Text(
                              '0',
                              style: TextStyle(color: Colors.white),
                            );
                          },
                          loaded: (carts) {
                            int totalQuantity = 0;
                            for (var cart in carts) {
                              totalQuantity += cart.quantity;
                            }
                            return Text(
                              totalQuantity.toString(),
                              style: const TextStyle(color: Colors.white),
                            );
                          },
                        );
                        // return Text(
                        //   '3',
                        //   style: TextStyle(color: Colors.white),
                        // );
                      },
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()),
                          );
                        },
                        icon: Image.asset(
                          Images.iconBuy,
                          height: 24.0,
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SizedBox()),
                        );
                      },
                      icon: Image.asset(
                        Images.iconNotificationHome,
                        height: 24.0,
                      )),
                ],
              ),
            ],
          ),
          const SpaceHeight(16.0),
          SearchInput(
            controller: searchController,
            onChanged: (value) {},
          ),
          const SpaceHeight(16.0),
          ImageSlider(items: images),
          const SpaceHeight(12.0),
          // const Text(
          //   "Kategori",
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w700,
          //     color: ColorName.primary,
          //   ),
          // ),
          // const SpaceHeight(12.0),
          // Row(
          //   children: [
          //     Flexible(
          //       child: CategoryButton(
          //         imagePath: Images.fashion1,
          //         label: 'Pakaian',
          //         onPressed: () {},
          //       ),
          //     ),
          //     Flexible(
          //       child: CategoryButton(
          //         imagePath: Images.fashion2,
          //         label: 'Pakaian',
          //         onPressed: () {},
          //       ),
          //     ),
          //     Flexible(
          //       child: CategoryButton(
          //         imagePath: Images.fashion3,
          //         label: 'Pakaian',
          //         onPressed: () {},
          //       ),
          //     ),
          //     Flexible(
          //       child: CategoryButton(
          //         imagePath: Images.more,
          //         label: 'Pakaian',
          //         onPressed: () {},
          //       ),
          //     ),
          //   ],
          // ),
          // const SpaceHeight(16.0),
          const Text(
            "Produk",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorName.primary,
            ),
          ),
          const SpaceHeight(8.0),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (model) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 55.0,
                    ),
                    itemCount: model.data.length,
                    itemBuilder: (context, index) => ProductCard(
                      data: model.data[index],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
