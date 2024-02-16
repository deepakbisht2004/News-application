import 'package:news_app/models/category_model.dart';


List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/images/business.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/images/entertainment.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.image = "assets/images/general.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/images/health.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/images/sport.jpg";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}