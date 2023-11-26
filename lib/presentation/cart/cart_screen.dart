// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/data/models/requests/order_request_model.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/presentation/cart/bloc/get_cost/get_cost_bloc.dart';
import 'package:ecommerce_app/presentation/cart/bloc/order/order_bloc.dart';
import 'package:ecommerce_app/presentation/payment/payment_screen.dart';
import 'package:ecommerce_app/presentation/shipping_address/bloc/get_address/get_address_bloc.dart';
import 'package:ecommerce_app/presentation/shipping_address/shipping_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/components/button.dart';
import 'package:ecommerce_app/common/components/row_text.dart';
import 'package:ecommerce_app/common/components/space_height.dart';
import 'package:ecommerce_app/common/constants/colors.dart';
import 'package:ecommerce_app/common/extensions/int_ext.dart';
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
    context.read<GetAddressBloc>().add(const GetAddressEvent.getAddress());
    super.initState();
  }

  List<Item> items = [];
  int localTotalPrice = 0;
  int idAddress = 0;

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Button.filled(
              width: 60,
              onPressed: () async {
                idAddress = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShippingAddressScreen()),
                );
                setState(() {});
              },
              label: 'Pilih Alamat Pengiriman',
            ),
          ),
          const SpaceHeight(16.0),

          // show alamat pengiriman
          BlocBuilder<GetAddressBloc, GetAddressState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (data) {
                  if (data.data.isEmpty) {
                    return const Center(
                      child: Text('Alamat belum tersedia'),
                    );
                  }
                  final address = idAddress != 0
                      ? data.data.firstWhere(
                          (element) => element.id == idAddress,
                          orElse: () => data.data.first,
                        )
                      : data.data.last;
                  context.read<GetCostBloc>().add(GetCostEvent.getCost(
                        origin: '5779',
                        destination:
                            address.attributes.subdistrictId.toString(),
                        courier: 'jne',
                      ));
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: ColorName.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Alamat Pengiriman',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SpaceHeight(16.0),
                        Text(
                          address.attributes.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorName.grey,
                          ),
                        ),
                        const SpaceHeight(8.0),
                        Text(
                          address.attributes.address,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorName.grey,
                          ),
                        ),
                        const SpaceHeight(8.0),
                        Text(
                          address.attributes.phone,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorName.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SpaceHeight(16.0),
          // const SpaceHeight(70.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: ColorName.border),
            ),
            child: Column(
              children: [
                const SpaceHeight(12.0),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return RowText(
                          label: 'Total Price',
                          value: 0.currencyFormatRp,
                        );
                      },
                      loaded: (carts) {
                        int totalPrice = 0;
                        for (var element in carts) {
                          totalPrice +=
                              int.parse(element.product.attributes!.price!) *
                                  element.quantity;
                        }
                        localTotalPrice = totalPrice;
                        items = carts
                            .map(
                              (item) => Item(
                                id: item.product.id!,
                                productName: item.product.attributes!.name!,
                                qty: item.quantity,
                                price:
                                    int.parse(item.product.attributes!.price!),
                              ),
                            )
                            .toList();
                        return RowText(
                          label: 'Total Harga',
                          value: totalPrice.currencyFormatRp,
                          valueColor: ColorName.primary,
                          fontWeight: FontWeight.w700,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(12.0),
                BlocBuilder<GetCostBloc, GetCostState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return RowText(
                          label: 'Biaya Pengiriman',
                          value: 0.currencyFormatRp,
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (cost) {
                        return RowText(
                          label: 'Biaya Pengiriman',
                          value: cost.rajaongkir.results.first.costs.first.cost
                              .first.value.currencyFormatRp,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(40.0),
                const Divider(color: ColorName.border),
                const SpaceHeight(12.0),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return RowText(
                          label: 'Total Harga',
                          value: 0.currencyFormatRp,
                        );
                      },
                      loaded: (carts) {
                        int totalPrice = 0;
                        for (var element in carts) {
                          totalPrice +=
                              int.parse(element.product.attributes!.price!) *
                                  element.quantity;
                        }
                        return RowText(
                          label: 'Total Harga',
                          value: totalPrice.currencyFormatRp,
                          valueColor: ColorName.primary,
                          fontWeight: FontWeight.w700,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(16.0),
                BlocConsumer<OrderBloc, OrderState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (response) {
                        context.read<CartBloc>().add(const CartEvent.started());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PaymentScreen(
                                invoiceUrl: response.invoiceUrl,
                                orderId: response.externalId,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return Button.filled(
                        onPressed: () {
                          context.read<OrderBloc>().add(
                                OrderEvent.order(
                                  OrderRequestModel(
                                    data: Data(
                                      items: items,
                                      totalPrice: localTotalPrice,
                                      deliveryAddress: 'Plumbon, Cirebon',
                                      courierName: 'JNE',
                                      courierPrice: 0,
                                      status: 'waiting-payment',
                                    ),
                                  ),
                                ),
                              );
                        },
                        label: 'Bayar Sekarang',
                      );
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
