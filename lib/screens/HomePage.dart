import 'package:explora_app/screens/FilePickerForDevices.dart';
import 'package:explora_app/screens/Navigators/CameraNavigator.dart';
import 'package:explora_app/screens/Navigators/MediaSelectorNavigator.dart';
import 'package:explora_app/screens/Navigators/PhoneNavigator.dart';
import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController pageController = PageController();

  List<BottomNavigationBarItem> get items => [
    BottomNavigationBarItem(icon: Icon(Icons.phone,color: Colors.grey.shade700,size: 24,),label: "Phone"),
    BottomNavigationBarItem(icon: Icon(Icons.camera,color: Colors.grey.shade700,size: 24,),label: "Camera"),
    BottomNavigationBarItem(icon: Icon(Icons.image,color: Colors.grey.shade700,size: 24,),label: "Media"),
  ];


  void handleNavigator(int index){
    pageController.jumpToPage(index);
    if(index == 0){
      onTappedPhone();
    }else if (index == 1){
      onTappedCamera();
    }else if (index == 2){
      onTappedMediaSelector();
    }
  }

 void onTappedPhone(){

 }

 void onTappedCamera(){

     ImagePicker().pickImage(source: ImageSource.camera).then((value) {

     });

 }

 void onTappedMediaSelector() async {
    await FilePickerForDevices().selectMedia().then((value){

    });
 }

  void handleOnPageChanged(index){

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ScreenBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleNavigator,
        items: items,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: handleOnPageChanged,
              children: [

                PhoneNavigator(),
                CameraNavigator(),
                MediaSelectorNavigator(),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
