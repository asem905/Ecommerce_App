class MyFavouritesModel {
  int? favouriteId;
  int? favouriteUsersid;
  int? favouriteItemsid;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCategory;
  int? usersId;

  MyFavouritesModel(
      {this.favouriteId,
      this.favouriteUsersid,
      this.favouriteItemsid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCategory,
      this.usersId});

  MyFavouritesModel.fromJson(Map<String, dynamic> json) {
    favouriteId = json['favourite_id'];
    favouriteUsersid = json['favourite_usersid'];
    favouriteItemsid = json['favourite_itemsid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item__name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCategory = json['item_category'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favourite_id'] = this.favouriteId;
    data['favourite_usersid'] = this.favouriteUsersid;
    data['favourite_itemsid'] = this.favouriteItemsid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item__name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_date'] = this.itemDate;
    data['item_category'] = this.itemCategory;
    data['users_id'] = this.usersId;
    return data;
  }
}