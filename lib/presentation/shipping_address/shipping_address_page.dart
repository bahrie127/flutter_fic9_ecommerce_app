import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/shipping_address/bloc/get_address/get_address_bloc.dart';

import '../../common/components/button.dart';
import '../../common/components/spaces.dart';
import 'add_address_page.dart';
import 'models/address_model.dart';
import 'widgets/address_tile.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAdressPageState();
}

class _ShippingAdressPageState extends State<ShippingAddressPage> {
  // final ValueNotifier<int> selectedIndex = ValueNotifier(1);
  final List<AddressModel> addresses = [
    AddressModel(
      name: 'Abdul Rozak',
      address: 'Jl. suka cita, no 17. kelurahan sukses maju',
      phoneNumber: '08566688686868',
    ),
    AddressModel(
      name: 'Abdul Manaf',
      address: 'Jalan lorem ipsum situ',
      phoneNumber: '08565658888976',
    ),
  ];

  int? idAddress;

  @override
  void initState() {
    context.read<GetAddressBloc>().add(const GetAddressEvent.getAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengiriman'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAddressPage()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<GetAddressBloc, GetAddressState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text('No Data'),
              );
            },
            loaded: (data) {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                separatorBuilder: (context, index) => const SpaceHeight(16.0),
                itemCount: data.data.length,
                itemBuilder: (context, index) => AddressTile(
                  isSelected: idAddress == data.data[index].id,
                  data: data.data[index],
                  onTap: () {
                    idAddress = data.data[index].id;
                    setState(() {});
                  },
                  onEditTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EditAddressPage(
                    //       data: addresses[index],
                    //     ),
                    //   ),
                    // );
                  },
                  onDeleteTap: () {},
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          disabled: idAddress == null,
          onPressed: () {
            Navigator.pop(context, idAddress);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const OrderDetailPage()),
            // );
          },
          label: 'Pilih',
        ),
      ),
    );
  }
}
