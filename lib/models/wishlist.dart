part of 'models.dart';

class Wishlists extends Equatable {
  final String wishlistId;
  final String wishlistName;
  final String wishlistBrand;
  final String wishlistType;
  final String wishlistPrice;
  final String wishlistTotal;
  final String wishlistImage;
  final String wishlistChecked;
  final String addBy;
  final String createdAt;
  final String updatedAt;

  Wishlists(
    this.wishlistId,
    this.wishlistName,
    this.wishlistBrand,
    this.wishlistType,
    this.wishlistPrice,
    this.wishlistTotal,
    this.wishlistImage,
    this.wishlistChecked,
    this.addBy,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object> get props => [
        wishlistId,
        wishlistName,
        wishlistBrand,
        wishlistType,
        wishlistPrice,
        wishlistTotal,
        wishlistImage,
        wishlistChecked,
        addBy,
        createdAt,
        updatedAt
      ];
}
