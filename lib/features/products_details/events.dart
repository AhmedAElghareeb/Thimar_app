class ShowProductsDetailsEvents {}

class GetProductsDetailsEvent extends ShowProductsDetailsEvents {
  int? id;

  GetProductsDetailsEvent({this.id});
}
