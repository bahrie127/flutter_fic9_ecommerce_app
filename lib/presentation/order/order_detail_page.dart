import 'package:flutter/material.dart';

import 'package:flutter_fic9_ecommerce_app/common/extensions/date_time_ext.dart';
import 'package:flutter_fic9_ecommerce_app/common/extensions/int_ext.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/buyer_order_response_model.dart';

import '../../common/components/button.dart';
import '../../common/components/row_text.dart';
import '../../common/components/spaces.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import 'models/order_product_model.dart';
import 'widgets/order_product_tile.dart';
import 'widgets/order_status.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({
    Key? key,
    required this.buyerOrder,
  }) : super(key: key);
  final BuyerOrder buyerOrder;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final List<OrderProductModel> products = [
    OrderProductModel(
      imagePath: Images.product1,
      name: 'Tas Kekinian',
      price: 200000,
    ),
    OrderProductModel(
      imagePath: Images.product2,
      name: 'Earphone',
      price: 199999,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int totalItem = 0;
    int item = 0;
    widget.buyerOrder.attributes.items.forEach((element) {
      totalItem += element.qty * element.price;
      item += element.qty;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const OrderStatus(
            status: ['Dikemas'],
          ),
          const SpaceHeight(24.0),
          const Text(
            'Produk',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.buyerOrder.attributes.items.length,
            itemBuilder: (context, index) => OrderProductTile(
              data: widget.buyerOrder.attributes.items[index],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pengiriman',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                RowText(
                  label: 'Waktu Pengiriman',
                  value: widget.buyerOrder.attributes.createdAt
                      .toFormattedDateWithDay(),
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ekspedisi Pengiriman',
                  value: widget.buyerOrder.attributes.courierName,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'No. Resi',
                  value: widget.buyerOrder.attributes.noResi,
                ),
                const SpaceHeight(12.0),
                // const RowText(
                //   label: 'Alamat',
                //   value: 'Jalan suka cita no 12',
                // ),
              ],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pembayaran',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                RowText(
                  label: 'Total Item ($item) ',
                  value: totalItem.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ongkir',
                  value: widget
                      .buyerOrder.attributes.courierPrice.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Total ',
                  value:
                      widget.buyerOrder.attributes.totalPrice.currencyFormatRp,
                  valueColor: ColorName.primary,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
