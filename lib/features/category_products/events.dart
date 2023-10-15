class CategoryProductsEvents {}

class GetCategoryProductsDataEvent extends CategoryProductsEvents {}

class GetSearchDataEvent extends CategoryProductsEvents {
  final String keyWord;

  GetSearchDataEvent({required this.keyWord});
}
