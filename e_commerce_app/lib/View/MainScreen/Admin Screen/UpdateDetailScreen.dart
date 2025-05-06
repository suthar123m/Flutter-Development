import 'package:e_commerce_app/Utilis/widget/Default_TextField.dart';
import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/ViewModel/UpdateProductDetailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Updatedetailscreen extends StatefulWidget {
  var id;

  Updatedetailscreen({required this.id});

  @override
  State<Updatedetailscreen> createState() => _UpdatedetailscreenState();
}

class _UpdatedetailscreenState extends State<Updatedetailscreen> {
  UpdateProductDetailController updateProductDetailController = Get.put(
    UpdateProductDetailController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateProductDetailController.loadDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Update Product Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                DefaultTextfield(
                  hintText: 'Enter BrandName',
                  labelText: 'BrandName',
                  validationText: 'Please Enter BrandName',
                  inputType: TextInputType.text,
                  controller: updateProductDetailController.brandNameController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Name',
                  labelText: 'Product Name',
                  validationText: 'Please Enter Product Name',
                  inputType: TextInputType.text,
                  controller:
                      updateProductDetailController.productNameController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Description',
                  labelText: 'Product Description',
                  validationText: 'Please Enter Product Description',
                  inputType: TextInputType.text,
                  controller:
                      updateProductDetailController
                          .productDescriptionController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Category',
                  labelText: 'Product Category',
                  validationText: 'Please Enter Product Category',
                  inputType: TextInputType.text,
                  controller:
                      updateProductDetailController.productCategoryController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Discount',
                  labelText: 'Product Discount',
                  validationText: 'Please Enter Product Discount',
                  inputType: TextInputType.number,
                  controller:
                      updateProductDetailController.productDisController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Price',
                  labelText: 'Product Price',
                  validationText: 'Please Enter Product Price',
                  inputType: TextInputType.number,
                  controller:
                      updateProductDetailController.productPriceController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Rating',
                  labelText: 'Product Rating',
                  validationText: 'Please Enter Product Rating',
                  inputType: TextInputType.number,
                  controller:
                      updateProductDetailController.productRatingController,
                ),
                GestureDetector(
                  onTap: () {
                    updateProductDetailController.updateDetail(widget.id);
                  },
                  child: DefaultButton(buttonText: 'Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
