import 'package:e_commerce_app/Utilis/widget/Default_TextField.dart';
import 'package:e_commerce_app/Utilis/widget/Default_button.dart';
import 'package:e_commerce_app/ViewModel/AddProductController.dart';
import 'package:e_commerce_app/ViewModel/DropDownCategoryController.dart';
import 'package:e_commerce_app/ViewModel/ImagePickerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductDetailsScreen extends StatefulWidget {
  const AddProductDetailsScreen({super.key});

  @override
  State<AddProductDetailsScreen> createState() =>
      _AddProductDetailsScreenState();
}

class _AddProductDetailsScreenState extends State<AddProductDetailsScreen> {
  //? Import AddProductController class with GetX

  final Addproductcontroller addProductController = Get.put(
    Addproductcontroller(),
  );

  //? Import DropDownCategoryController class with GetX

  final Dropdowncategorycontroller dropdownCategoryController = Get.put(
    Dropdowncategorycontroller(),
  );

  //? Import ImagePickerController class with Getx

  final ImagePickerController imagePickerController = Get.put(
    ImagePickerController(),
  );

  final _formKey = GlobalKey<FormState>();

  //? Function for Show BottomNavigationBar

  void _showPickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 5,
      showDragHandle: true,
      builder:
          (_) => SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Take Photo"),
                  onTap: () {
                    imagePickerController.pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Choose from Gallery"),
                  onTap: () {
                    imagePickerController.pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product Details')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _showPickerBottomSheet,
                  child: Center(
                    child: Obx(() {
                      final pickedImage =
                          imagePickerController.pickedImage.value;
                      return CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.black12,
                        backgroundImage:
                            pickedImage != null ? FileImage(pickedImage) : null,
                        child:
                            pickedImage == null
                                ? Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.black26,
                                )
                                : null,
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 10),
                DefaultTextfield(
                  hintText: 'Enter Product Name',
                  labelText: 'Product Name',
                  validationText: 'Please Enter Product Name',
                  inputType: TextInputType.name,
                  controller: addProductController.productNameController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Brand Name',
                  labelText: 'Brand Name',
                  validationText: 'Please Enter Brand Name',
                  inputType: TextInputType.name,
                  controller: addProductController.brandNameController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Price',
                  labelText: 'Product Price',
                  validationText: 'Please Enter Product Price',
                  inputType: TextInputType.number,
                  controller: addProductController.productPriceController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Discount',
                  labelText: 'Product Discount',
                  validationText: 'Please Enter Product Discount',
                  inputType: TextInputType.number,
                  controller: addProductController.productDisController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Rating',
                  labelText: 'Product Rating',
                  validationText: 'Please Enter Product Rating',
                  inputType: TextInputType.number,
                  controller: addProductController.productRatingController,
                ),
                DefaultTextfield(
                  hintText: 'Enter Product Description',
                  labelText: 'Product Description',
                  validationText: 'Please Enter Product Description',
                  inputType: TextInputType.multiline,
                  controller: addProductController.productDescriptionController,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 65,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Obx(() {
                    return DropdownButton<String>(
                      value: dropdownCategoryController.selectedValue.value,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (value) {
                        if (value != null) {
                          dropdownCategoryController.changeValue(value);
                        }
                      },
                      items:
                          dropdownCategoryController.items
                              .map(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                    );
                  }),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await addProductController.addProduct();
                    }
                  },
                  child: Obx(() {
                    return addProductController.isLoading.value
                        ? SpinKitCircle(color: Colors.deepOrange, size: 30)
                        : DefaultButton(buttonText: 'Add Detail');
                  }),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
