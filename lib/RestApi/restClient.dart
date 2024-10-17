import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Style/style.dart';

var BaseURL="http://152.42.163.176:2008/api/v1";

Future<List> ProductGridViewListRequest() async {
  var URL=Uri.parse("${BaseURL}/ReadProduct");
  var PostHeader={"Content-Type":"application/json"};
  var response= await http.get(URL,headers:PostHeader);
  print(response.body);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> ProductCreateRequest(FromValues) async{
  var URL=Uri.parse("${BaseURL}/CreateProduct");
  var PostBody=json.encode(FromValues);
  var PostHeader={"Content-Type":"application/json"};
  var response= await  http.post(URL,headers:PostHeader,body: PostBody);
    print(response.body);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
     print('hi');

  if(ResultCode==200 && ResultBody['status']=='success'){
    SuccessToast("Request Success");
    print('response successful');
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> ProductDeleteRequest(id) async{
  var URL=Uri.parse("${BaseURL}/DeleteProduct/${id}");
  var PostHeader={"Content-Type":"application/json"};
  var response= await http.get(URL,headers:PostHeader);
  print(response.body);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=='success'){
    SuccessToast("Request Success");
    print('response successful');
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }


}

Future<bool> ProductUpdateRequest(FromValues,id) async{
  var URL=Uri.parse("${BaseURL}/UpdateProduct/${id}");
  var PostBody=json.encode(FromValues);
  var PostHeader={"Content-Type":"application/json"};
  var response= await  http.post(URL,headers:PostHeader,body: PostBody);
  print(response.body);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  print('hi');

  if(ResultCode==200 && ResultBody['status']=='success'){
    SuccessToast("Request Success");
    print('response successful');
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}
