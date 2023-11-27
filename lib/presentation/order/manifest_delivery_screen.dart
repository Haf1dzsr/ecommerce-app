import 'package:another_stepper/another_stepper.dart';
import 'package:ecommerce_app/common/extensions/date_time_ext.dart';
import 'package:ecommerce_app/presentation/order/bloc/cek_resi/cek_resi_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/data/models/responses/buyer_order_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManifestDeliveryScreen extends StatefulWidget {
  final BuyerOrder buyerOrder;
  const ManifestDeliveryScreen({
    Key? key,
    required this.buyerOrder,
  }) : super(key: key);

  @override
  State<ManifestDeliveryScreen> createState() => _ManifestDeliveryScreenState();
}

class _ManifestDeliveryScreenState extends State<ManifestDeliveryScreen> {
  List<StepperData> stepperData = [];

  @override
  void initState() {
    context.read<CekResiBloc>().add(CekResiEvent.getCekResi(
          resi: widget.buyerOrder.attributes.noResi,
          courier: widget.buyerOrder.attributes.courierName,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lacak Pengiriman'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: BlocBuilder<CekResiBloc, CekResiState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                      child: Text('Resi not found'),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (data) {
                    int indexStep = 0;
                    stepperData = data.rajaongkir.result.manifest.map((e) {
                      indexStep++;
                      return StepperData(
                        title: StepperText(
                          e.manifestCode,
                          textStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        subtitle: StepperText(
                            '${e.manifestDate.toFormattedDateWithDay()} ${e.manifestTime} \n ${e.manifestDescription}'),
                        iconWidget: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              '$indexStep',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList();
                    return AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth:
                          40, // Height that will be applied to all the stepper icons
                      iconHeight:
                          40, // Width that will be applied to all the stepper icons
                    );
                  },
                  error: (error) => const Center(
                    child: Text('Resi not found'),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
