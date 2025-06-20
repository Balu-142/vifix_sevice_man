import 'package:demandium_serviceman/utils/core_export.dart';
import 'package:get/get.dart';

class PaymentStatusButton extends StatelessWidget {
  const PaymentStatusButton({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingEditController>(builder: (bookingEditController){
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha:0.2))
        ),
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeExtraSmall+2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Text("payment_status".tr, style: robotoRegular.copyWith(),),

          FlutterSwitch(
            width: 75, height: 32, valueFontSize: Dimensions.fontSizeExtraSmall, showOnOff: true,
            activeText: 'paid'.tr, inactiveText: 'unpaid'.tr, activeColor: Theme.of(context).primaryColor,
            value: bookingEditController.paymentStatusPaid,
            padding: 4,
            onToggle: (bool isActive) async {
              bookingEditController.togglePaymentStatus();
            },
          ),
        ],),
      );
    });
  }
}
