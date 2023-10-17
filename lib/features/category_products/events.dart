class CategoryProductsEvents {}

class GetCategoryProductsDataEvent extends CategoryProductsEvents {
  bool fromPagination = false;

  GetCategoryProductsDataEvent({required this.fromPagination});
}

class GetSearchDataEvent extends CategoryProductsEvents {
  final String keyWord;

  GetSearchDataEvent({required this.keyWord});
}
