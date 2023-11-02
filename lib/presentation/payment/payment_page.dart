import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_fic9_ecommerce_app/presentation/payment/bloc/order_detail/order_detail_bloc.dart';

import 'widgets/failed_page.dart';
import 'widgets/success_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
    required this.invoiceUrl,
    required this.orderId,
  }) : super(key: key);
  final String invoiceUrl;
  final String orderId;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
          onPageStarted: (String url) {},
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
      //do check payment status here
      //if status is success, navigate to success page
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      //   return const SuccessPage();
      // }));
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
    //call check status every 5 seconds with timer

    return Scaffold(
      body: BlocListener<OrderDetailBloc, OrderDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (order) {
              if (order.data.attributes.status == 'packaging') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return const SuccessPage();
                }));
              } else if (order.data.attributes.status == 'failed') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return const FailedPage();
                }));
              }
            },
          );
        },
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
