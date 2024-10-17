
import 'package:flutter/material.dart';
import '../RestApi/restClient.dart';
import '../Style/style.dart';
import 'ProductGridViewScreen.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map<String,dynamic> FromValues = {"ProductName": "", "ProductCode": "", "Img": "", "Qty": "", "UnitPrice": "", "TotalPrice": ""};
  bool Loading = false;
  InputOnChange(MapKey, Textvalue){
    setState(() {
      FromValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FromValues['ProductName']!.length==0){
      ErrorToast('ProductName Required !');
    }
    else if(FromValues['ProductCode']!.length==0){
      ErrorToast('Product Code Required !');
    }
    else if(FromValues['Img']!.length==0){
      ErrorToast('Img  Required !');
    }
    else if(FromValues['Qty']!.length==0){
      ErrorToast('Product Qty Required !');
    }
    else if(FromValues['UnitPrice']!.length==0){
      ErrorToast('UnitPrice  Required !');
    }
    else if(FromValues['TotalPrice']!.length==0){
      ErrorToast('TotalPrice Required !');
    }
    else{
      // data post restApi
      setState(() {
        Loading=true;
      });
      await ProductCreateRequest(FromValues);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=> ProductGridViewScreen(),),
              (Route route)=>false
      );
      // setState(() {
      //   Loading=false;
      // });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Create"),),
      body: Stack(
        children: [
          // Image.network("assets/images/screen-back.svg"),
          Container(
              child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("ProductName",Textvalue);
                    },
                      decoration: AppInputDecoration("Product Name"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("ProductCode",Textvalue);
                    },
                      decoration: AppInputDecoration("Product Code"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("Img",Textvalue);
                    },
                      decoration: AppInputDecoration("Product Image"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("UnitPrice",Textvalue);
                    },
                      decoration: AppInputDecoration("Unit Price"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("TotalPrice",Textvalue);
                    },
                      decoration: AppInputDecoration("Total Price"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(onChanged: (Textvalue){
                      InputOnChange("Qty",Textvalue);
                    },
                      decoration: AppInputDecoration("Quantity"),
                    ),
                    // AppDropDownStyle(
                    //     DropdownButton(
                    //       value:FromValues["Qty"] ,
                    //       items:[
                    //         DropdownMenuItem(child: Text("Select Qt"),value: "",),
                    //         DropdownMenuItem(child: Text("1 pcs"),value: "1 pcs",),
                    //         DropdownMenuItem(child: Text("2 pcs"),value: "2 pcs",),
                    //         DropdownMenuItem(child: Text("3 pcs"),value: "3 pcs",),
                    //         DropdownMenuItem(child: Text("4 pcs"),value: "4 pcs",),
                    //       ],
                    //       onChanged: (Textvalue){
                    //         InputOnChange("Qty",Textvalue);
                    //       },
                    //       underline: Container(),
                    //       isExpanded: true,
                    //     )
                    // ),
                    SizedBox(height: 20,),
                    Container(
                        child: ElevatedButton(
                            style: AppButtonStyle(),
                            onPressed: (){
                              FormOnSubmit();
                            }, child: SuccessButtonChild("Submit"))
                    )

                  ],
                ),
              ))
          )
        ],
      ),
    );
  }
}