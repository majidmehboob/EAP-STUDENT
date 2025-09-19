

import 'package:flutter/material.dart';

class OurProviderClass extends ChangeNotifier{


  int _currentIndex = 0;
  int testValue=0;
  bool isRefreshCalled=false;
  bool isBestPackageRefreshed=false;
  bool getclassSubject=false;
  bool getMyPackages=false;

  int currentPageForGeneratePaperWizard=0;


  int get getIndex{
    return _currentIndex;
  }

  int get getCurrentPageForGeneratePaperWizard{
    return currentPageForGeneratePaperWizard;
  }

  bool get getRefreshCalled{
    return isRefreshCalled;
  }
  bool get getClsSubjectBook{
    return getclassSubject;
  }



  void setRefreshCalled(bool value){
    isRefreshCalled = value;
    notifyListeners();
  }

  void setBestPackageRefresh(bool value){
    isBestPackageRefreshed = value;
    notifyListeners();
  }

  void setClsSubjectBook(bool value){
    getclassSubject = value;
    notifyListeners();
  }
  void setMyPackages(bool value){
    getMyPackages = value;
    notifyListeners();
  }




  int get getTestValue{
    return testValue;
  }


  void changeBottomNavBarIndex(int index){
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }

  void changeCurrentPageForGeneratePaperWizard(int index){
    currentPageForGeneratePaperWizard = index;
    notifyListeners();
  }





  void onlyChangeNotifier(){
    notifyListeners();
  }

}