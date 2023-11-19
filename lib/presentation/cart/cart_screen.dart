// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/row_text.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/extensions/int_ext.dart';
import 'package:ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:ecommerce_app/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_app/presentation/cart/widgets/cart_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (carts) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(16.0),
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        data: CartModel(
                          product: carts[index].product,
                          quantity: carts[index].quantity,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(70.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                // RowText(
                //   label: 'Item (${carts.length})',
                //   value: 1750000.currencyFormatRp,
                // ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Biaya Pengiriman',
                  value: 150000.currencyFormatRp,
                ),
                const SpaceHeight(40.0),
                const Divider(color: ColorName.border),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Total Harga',
                  value: 1900000.currencyFormatRp,
                  valueColor: ColorName.primary,
                  fontWeight: FontWeight.w700,
                ),
                const SpaceHeight(16.0),
                Button.filled(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const PaymentScreen(
                    //       url: '',
                    //     ),
                    //   ),
                    // );
                  },
                  label: 'Bayar Sekarang',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
