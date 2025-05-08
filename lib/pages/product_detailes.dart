import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:moda/models/product_model.dart';
import 'package:moda/widgets/category_filter.dart';
import 'package:moda/widgets/custom_appbar.dart';

class ProductDetailes extends StatefulWidget {
  const ProductDetailes({super.key, required this.item});

  final ProductModel item;

  @override
  State<ProductDetailes> createState() => _ProductDetailesState();
}

class _ProductDetailesState extends State<ProductDetailes> {
  ScrollController scrollDragController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          barrierColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.12,
              minChildSize: 0.09,
              maxChildSize: 0.8,
              builder: (
                BuildContext context,
                ScrollController scrollController,
              ) {
                return ListView(
                  controller: scrollController,
                  // physics: BouncingScrollPhysics(),
                  // padding: EdgeInsets.only(
                  //   top: 20,
                  //   left: 10,
                  //   right: 10,
                  //   bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  // ),
                  children: [
                    Container(
                      height: 100, // Adjusted height
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(10),
                            Center(
                              child: Container(
                                height: 6,
                                width: 72,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Gap(10),
                            Text(
                              widget.item.name,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gap(7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${widget.item.price}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 36,
                                    ),
                                    Gap(2),
                                    Text(
                                      "290",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(8),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),

                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Select Color',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Gap(10),
                                SvgPicture.asset('assets/svgs/select.svg'),
                              ],
                            ),
                            // const VerticalDivider(
                            //   color: Colors.black12,
                            //   thickness: 1,
                            //   width: 20,
                            // ),
                            Container(
                              height: 30,
                              width: 2,
                              color: Colors.black12,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Select Size',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Gap(10),
                                SvgPicture.asset('assets/svgs/select.svg'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: Center(
                          child: Text(
                            "Add To Bag",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(
        title: "Men",
        action: 'assets/svgs/cart.svg',
        leading: 'assets/svgs/arrow-left.svg',
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategoryFilter(),
            Gap(13),

            Stack(
              children: [
                Center(child: Image.asset(widget.item.image, height: 560)),
                Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Image.asset('assets/images/shadow.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
