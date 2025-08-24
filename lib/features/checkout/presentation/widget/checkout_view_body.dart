import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hup/core/helper_function/build_error_bar.dart';
import 'package:fruit_hup/core/widget/custom_button.dart';
import 'package:fruit_hup/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit_hup/features/checkout/domain/entites/paypal_payment_entity/order_entity.dart';
import 'package:fruit_hup/features/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_hup/features/checkout/presentation/cubit/check_out_cubit_cubit.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/check_out_steps.dart';
import 'package:fruit_hup/features/checkout/presentation/widget/check_out_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckOutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckOutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
              oppressed: () {
                if (currentPageIndex == 0) {
                  _handleShippingSecValidation(context);
                } else if (currentPageIndex == 1) {
                  _handleAddressSecValidation(context);
                } else {
                  var orderEntity = context.read<OrderEntity>();
                  context.read<AddOrderCubit>().addOrder(order: orderEntity);
                  // _processPayment(context);
                  buildCustomSnackBar(
                    context,
                    title: ' تم العملية بنجاح',
                    message: 'سيتم التواصل معك قريبا',
                    contentType: ContentType.success,
                  );
                }
              },
              text: getNextCurrentIndex(currentPageIndex)),
          const SizedBox(
            height: 34,
          )
        ],
      ),
    );
  }

  void _handleAddressSecValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handleShippingSecValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      buildCustomSnackBar(
        context,
        title: 'تحذير ⚠️',
        message: 'يرجى تحديد طريقة الدفع',
        contentType: ContentType.warning,
      );
    }
  }

  String getNextCurrentIndex(int index) {
    switch (index) {
      case 0:
        return 'التالى';
      case 1:
        return 'التالى';
      case 2:
        return 'الدفع بواسطة PayPal';
      default:
        return 'Next';
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity as OrderInputEntity);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              //   "shipping_address": {
              //     "recipient_name": "tharwat",
              //     "line1": "Alexandria",
              //     "line2": "",
              //     "city": "Alexandria",
              //     "country_code": "EG",
              //     "postal_code": "21505",
              //     "phone": "+00000000",
              //     "state": "Alexandria"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
