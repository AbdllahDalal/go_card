import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_store_app/models/prodect_modle.dart';
import 'package:get/get.dart';

import '../models/card_prodect_modle.dart';
import '../utilities/t_keys.g.dart';

class ProdectController extends GetxController {
  var _prodectColorIndex = 0.obs;

  int get prodectColorIndex => _prodectColorIndex.value;

  final CarouselController _prodectImagesSliderController =
      CarouselController();
  CarouselController get prodectImagesSliderController =>
      _prodectImagesSliderController;

  var selectSpecifications = <String, dynamic>{};

  // RxMap<String, dynamic> get

  var _prodectQuantity = 1.obs;

  int get prodectQuantity => _prodectQuantity.value;

  late final List<CardProdect> _cardprodects = [];

  List<CardProdect> get cardprodects => _cardprodects;

  late double totalPrice = 0;
  late double taxes = 0;
  late double totalPriceWithTaxes = 0;

  final _payMethod = LocaleKeys.cashOnDelivery.obs;

  String get payMethod => _payMethod.value;

  final _selectLocation = "0".obs;

  String get selectLocation => _selectLocation.value;

  var _mapLocation = "";

  String get mapLocation => _mapLocation;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // Your initialization logic here
    // print('Controller initialized');
  }

  void changeColorIndex(int index) {
    _prodectColorIndex.value = index;
  }

  void cleanColorIndex() {
    _prodectColorIndex = 0.obs;
  }

  void goToPage(int index) {
    _prodectImagesSliderController.animateToPage(
      index,
    );
    // notifyListeners();
  }

  void cleanSelectSpecifications() {
    selectSpecifications.clear();
  }

  void decreaseQuantity() {
    if (prodectQuantity > 1) {
      _prodectQuantity--;
    }
  }

  void increaseQuantity() {
    _prodectQuantity++;
  }

  void cleanQuantity() {
    _prodectQuantity.value = 1;
  }

  void addProdectToCard(Prodect prodect) {
    _cardprodects.add(CardProdect(
        id: _cardprodects.length,
        prodect: prodect,
        colorIndex: _prodectColorIndex.value,
        quantity: _prodectQuantity.value,
        specifications: selectSpecifications,
        image: prodect.image[_prodectColorIndex.value]));
    update();
    cartTotlePriceUpDate();
  }

  void decreaseQuantityCard(int index) {
    if (_cardprodects[index].quantity > 1) {
      _cardprodects[index].quantity--;
    }
    cartTotlePriceUpDate();
    update();
  }

  void increaseQuantityCard(int index) {
    _cardprodects[index].quantity++;
    cartTotlePriceUpDate();
    update();
  }

  void removeCardProdect(int index) {
    _cardprodects.removeAt(index);
    cartTotlePriceUpDate();
    update();
  }

  void clearCardProdect() {
    _cardprodects.clear();
    cartTotlePriceUpDate();
    update();
  }

  void selectPayMethod(String value) {
    _payMethod.value = value;
  }

  void selectlocation(String value) {
    _selectLocation.value = value;
  }

  void cartTotlePriceUpDate() {
    totalPrice = 0;
    for (var element in cardprodects) {
      totalPrice += (element.quantity * element.prodect.price);
    }
    taxes = totalPrice * (12 / 100);
    totalPriceWithTaxes = totalPrice + taxes;
  }

  void selectMaplocation(String value) {
    _mapLocation = value;
  }
}
