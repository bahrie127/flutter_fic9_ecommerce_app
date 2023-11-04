import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/city_response_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/subdistrict_response_model.dart';
import 'package:flutter_fic9_ecommerce_app/presentation/shipping_address/bloc/city/city_bloc.dart';

import '../../common/components/button.dart';
import '../../common/components/custom_dropdown.dart';
import '../../common/components/custom_text_field2.dart';
import '../../common/components/spaces.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/models/responses/province_response_model.dart';

import 'bloc/add_address/add_address_bloc.dart';
import 'bloc/province/province_bloc.dart';
import 'bloc/subdistrict/subdistrict_bloc.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isDefault = false;

  Province selectedProvince = Province(
    provinceId: '1',
    province: 'Bali',
  );

  City selectedCity = City(
    cityId: '1',
    provinceId: '1',
    province: 'Bali',
    type: 'Kabupaten',
    cityName: 'Badung',
    postalCode: '80351',
  );

  SubDistrict selectedSubDistrict = SubDistrict(
    subdistrictId: '1',
    provinceId: '1',
    province: 'Bali',
    cityId: '1',
    city: 'Badung',
    type: 'Kabupaten',
    subdistrictName: 'Kuta',
  );

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getAll());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();

    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Alamat'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: nameController,
            label: 'Nama Lengkap',
            keyboardType: TextInputType.name,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: addressController,
            label: 'Alamat Jalan',
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.phone,
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (provinces) {
                  selectedProvince = provinces.first;
                  return CustomDropdown<Province>(
                    value: selectedProvince,
                    items: provinces,
                    label: 'Provinsi',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value!;
                        context.read<CityBloc>().add(
                              CityEvent.getAllByProvinceId(
                                selectedProvince.provinceId,
                              ),
                            );
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {},
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (cities) {
                  selectedCity = cities.first;
                  return CustomDropdown<City>(
                    value: selectedCity,
                    items: cities,
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        context.read<SubdistrictBloc>().add(
                              SubdistrictEvent.getAllByCityId(
                                selectedCity.cityId,
                              ),
                            );
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kecamatan',
                    onChanged: (value) {},
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (subdistricts) {
                  selectedSubDistrict = subdistricts.first;
                  return CustomDropdown<SubDistrict>(
                    value: selectedSubDistrict,
                    items: subdistricts,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(() {
                        selectedSubDistrict = value!;
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          CheckboxListTile(
            value: isDefault,
            onChanged: (value) {
              setState(() {
                isDefault = value!;
              });
            },
            title: const Text('Simpan sebagai alamat utama'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddAddressBloc, AddAddressState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (response) {
                Navigator.pop(context, response);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  onPressed: () async {
                    //get userID from local storage
                    final userId = (await AuthLocalDatasource().getUser()).id;
                    context.read<AddAddressBloc>().add(
                          AddAddressEvent.addAddress(
                            name: nameController.text,
                            address: addressController.text,
                            phone: phoneNumberController.text,
                            provinceId: selectedProvince.provinceId,
                            cityId: selectedCity.cityId,
                            subdistrictId: selectedSubDistrict.subdistrictId,
                            provinceName: selectedProvince.province,
                            cityName: selectedCity.cityName,
                            subdistrictName:
                                selectedSubDistrict.subdistrictName,
                            codePos: zipCodeController.text,
                            userId: userId!.toString(),
                            isDefault: isDefault,
                          ),
                        );
                  },
                  label: 'Tambah Alamat',
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (message) {
                return Button.filled(
                  onPressed: () {},
                  label: 'Error',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
