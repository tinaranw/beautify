part of 'models.dart';

class Products extends Equatable {
  final String productId;
  final String productName;
  final String productBrand;
  final String productDate;
  final String productType;
  final String productCondition;
  final String productDesc;
  final String productPrice;
  final String productImage;
  final String addBy;
  final String createdAt;
  final String updatedAt;

  Products(
    this.productId,
    this.productName,
    this.productBrand,
    this.productDate,
    this.productType,
    this.productCondition,
    this.productDesc,
    this.productPrice,
    this.productImage,
    this.addBy,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object> get props => [
        productId,
        productName,
        productBrand,
        productDate,
        productType,
        productCondition,
        productDesc,
        productPrice,
        productImage,
        addBy,
        createdAt,
        updatedAt
      ];
}
