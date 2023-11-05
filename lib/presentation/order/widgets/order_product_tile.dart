import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_app/common/extensions/int_ext.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/buyer_order_response_model.dart';

import '../../../common/components/spaces.dart';
import '../../../common/constants/colors.dart';
import '../models/order_product_model.dart';

class OrderProductTile extends StatelessWidget {
  final Item data;
  const OrderProductTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: ColorName.border),
      ),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          //   child: Image.asset(
          //     data.imagePath,
          //     width: 72.0,
          //     height: 72.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SpaceWidth(12.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.productName} x (${data.qty} item)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpaceHeight(20.0),
                Text(
                  '${data.price.currencyFormatRp} x ${data.qty} item = ${(data.price * data.qty).currencyFormatRp}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
