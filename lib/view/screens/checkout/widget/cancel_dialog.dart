import 'package:flutter/material.dart';
import 'package:flutter_grocery/helper/route_helper.dart';
import 'package:flutter_grocery/localization/language_constrants.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:flutter_grocery/view/base/custom_button.dart';

class CancelDialog extends StatelessWidget {
  final int orderID;
  CancelDialog({@required this.orderID});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Container(
            height: 70, width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor, size: 50,
            ),
          ),
          //SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          // fromCheckout ? Text(
          //   getTranslated('order_placed_successfully', context),
          //   style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor),
          // ) : SizedBox(),
          // SizedBox(height: fromCheckout ? Dimensions.PADDING_SIZE_SMALL : 0),

          orderID != null || orderID != 'null' ?   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('${getTranslated('order_id', context)}:', style: poppinsMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(orderID.toString(), style: poppinsMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
          ]) : SizedBox(),
          SizedBox(height: 30),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.info, color: Theme.of(context).primaryColor),
            Text(
              getTranslated('payment_failed', context),
              style: poppinsMedium.copyWith(color: Theme.of(context).primaryColor),
            ),
          ]),
          SizedBox(height: 10),

          Text(
            getTranslated('payment_process_is_interrupted', context),
            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          Row(children: [
            Expanded(child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, RouteHelper.getMainRoute(), (route) => false);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Theme.of(context).primaryColor)),
                ),
                child: Text(getTranslated('maybe_later', context), style: poppinsMedium.copyWith(color: Theme.of(context).primaryColor)),
              ),
            )),
            SizedBox(width: 10),
            Expanded(child: CustomButton(buttonText: 'Order Details', onPressed: () {
              Navigator.pop(context);
            })),
          ]),

        ]),
      ),
    );
  }
}
