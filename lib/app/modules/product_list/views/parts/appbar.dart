part of '../product_list_view.dart';

class SearchBar extends GetView<ProductListController> {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      builder: (_) {
        return TextFormField(
          controller: controller.searchController,
          onFieldSubmitted: controller.onChangeSearch,
          decoration: InputDecoration(
            hintText: 'Cari produk',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
          ),
        );
      },
    );
  }
}
