import 'package:flutter/material.dart';
import 'package:flutter_grocery/data/model/response/product_model.dart';
import 'package:flutter_grocery/helper/product_type.dart';
import 'package:flutter_grocery/helper/responsive_helper.dart';
import 'package:flutter_grocery/provider/product_provider.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/view/base/product_widget.dart';
import 'package:flutter_grocery/view/base/web_product_shimmer.dart';
import 'package:provider/provider.dart';

class HomeItemView extends StatelessWidget {
  final bool isDailyItem;

  const HomeItemView({Key key, this.isDailyItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, child) {
      List<Product> _productList = [];
      if(isDailyItem) {
        _productList = productProvider.dailyItemList;
      }else{
        _productList = productProvider.popularProductList;
      }

      return _productList != null ? Column(children: [

        ResponsiveHelper.isDesktop(context) ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio:  (1 / 1.3),
            crossAxisCount: 5,
            mainAxisSpacing: 13,
            crossAxisSpacing: 13,
          ),
          itemCount: _productList.length >= 10 ? 10 : _productList.length,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical: Dimensions.PADDING_SIZE_LARGE),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index){
            return ProductWidget(
              isGrid: true,
              product: _productList[index],
              productType: ProductType.DAILY_ITEM,
            );
            },
        ) :
        SizedBox(
          height: 290,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            itemCount: _productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 195,
                padding: EdgeInsets.all(5),
                child: ProductWidget(
                  isGrid: true,
                  product: _productList[index],
                  productType: ProductType.DAILY_ITEM,
                ),
              );
              },
          ),
        ),

      ]) : ResponsiveHelper.isDesktop(context) ?
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:  (1 / 1.3),
          crossAxisCount: 5,
          mainAxisSpacing: 13,
          crossAxisSpacing: 13,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => WebProductShimmer(isEnabled: true),
      ) :
      SizedBox(
        height: 250,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 195,
              padding: EdgeInsets.all(5),
              child: WebProductShimmer(isEnabled: true),
            );
          },
        ),
      );
    });
  }
}



