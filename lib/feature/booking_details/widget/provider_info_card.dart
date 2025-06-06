import 'package:get/get.dart';
import 'package:demandium_serviceman/utils/core_export.dart';

class BookingDetailsProviderInfo extends StatelessWidget {
  final BookingDetailsContent bookingDetails;
  const BookingDetailsProviderInfo({super.key, required this.bookingDetails}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withValues(alpha:0.5),
          boxShadow: Get.find<ThemeController>().darkTheme ? null : lightShadow
      ),
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault, horizontal: Dimensions.paddingSizeDefault),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start ,children: [

        Text("provider_info".tr,style:robotoMedium.copyWith(
            fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).primaryColorLight) ,
        ),
        const SizedBox(height:Dimensions.paddingSizeDefault),

        BottomCard(
          name: bookingDetails.provider?.companyName ??  bookingDetails.subBooking?.provider?.companyName ?? "",
          phone: bookingDetails.provider?.companyPhone ?? bookingDetails.subBooking?.provider?.companyPhone ?? "",
          image:  bookingDetails.provider?.logoFullPath ?? bookingDetails.subBooking?.provider?.logoFullPath ?? "",
        ),

const SizedBox(height: Dimensions.paddingSizeSmall),
        Text(
          "customer_info".tr,
          style: robotoMedium.copyWith(
              fontSize: Dimensions.fontSizeDefault,
              color: Theme.of(context).primaryColor),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        BottomCard(
          name: bookingDetails.serviceAddress?.contactPersonName ??
              bookingDetails
                  .subBooking?.serviceAddress?.contactPersonName ??
              "${bookingDetails.customer?.firstName ?? ""} ${bookingDetails.customer?.lastName ?? ""}",
          phone: bookingDetails.serviceAddress?.contactPersonNumber ??
              bookingDetails
                  .subBooking?.serviceAddress?.contactPersonNumber ??
              bookingDetails.customer?.phone ??
              bookingDetails.customer?.email ??
              "",
          image: bookingDetails.customer?.profileImageFullPath ??
              bookingDetails.subBooking?.customer?.profileImageFullPath ??
              "",
          address: bookingDetails.serviceAddress?.address ??
              bookingDetails.subBooking?.serviceAddress?.address ??
              'address_not_found'.tr,
        ),

      ]),
    );
  }
}
