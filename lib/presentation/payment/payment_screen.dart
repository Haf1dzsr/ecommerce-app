// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecommerce_app/presentation/payment/bloc/order_detail/order_detail_bloc.dart';
import 'package:ecommerce_app/presentation/payment/failed_screen.dart';
import 'package:ecommerce_app/presentation/payment/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required this.invoiceUrl,
    required this.orderId,
  }) : super(key: key);
  final String invoiceUrl;
  final String orderId;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewController? _controller;
  Timer? _timer;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            // if (url.contains('status_code=202&transaction_status=deny')) {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) {
            //     return const FailedScreen();
            //   }));
            // }
            // if (url.contains('status_code=200&transaction_status=settlement')) {
            //   Navigator.push(context, MaterialPageRoute(builder: (_) {
            //     return const SuccessScreen();
            //   }));
            // }
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl));
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      context
          .read<OrderDetailBloc>()
          .add(OrderDetailEvent.getOrderDetail(widget.orderId));
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OrderDetailBloc, OrderDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (order) {
              if (order.data.attributes.status == 'packaging') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SuccessScreen();
                  }),
                );
              } else if (order.data.attributes.status == 'failed') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const FailedScreen();
                  }),
                );
              }
            },
          );
        },
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
