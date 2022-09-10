import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raghu_education/constants/env.dart';
import 'package:raghu_education/services/api_client.dart';
import 'package:raghu_education/services/api_provider/checkout_endpoint_provider.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../view/home/saved/payment screen/payment controller/sucessfull payment/sucessfull_payment.dart';

class PaymentGatewayController extends GetxController {
  late Razorpay _razorpay;
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    Client client = Client();
    CheckOutEndPointProvider checkOutEndPointProvider =
        CheckOutEndPointProvider(client: client.init());
    try {
      checkOutEndPointProvider.checkOut().then((value) {
        callRazorPay(
            double.parse(value["total"]!.toString()), value["orderId"]!);
      }, onError: (err) {
        CommanLoader.message(err.toString());
      });
    } on Exception catch (e) {
      CommanLoader.message(e.toString());
    }
  }

  callRazorPay(double total, String orderId) async {
    var options = {
      'key': razorPayKey,
      'amount': total * 100,
      'order_id': orderId,
      'name': 'Video App',
      'description': 'Payment For Course',
      /* 'external': {
        'wallets': ['paytm']
      } */
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.to(() => SuccessfullPayment());
    //Get.snackbar("SUCCESS", "ID: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
        "ERROR", "CODE: ${response.code}  MESSAGE:${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("EXTERNAL WALLET", "WALLET NAME: ${response.walletName}");
  }
}
