class ProductsEvents {}

class GetProductsDataEvent extends ProductsEvents {
  int? id;

  GetProductsDataEvent({this.id});
}
