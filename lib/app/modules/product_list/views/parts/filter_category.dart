part of '../product_list_view.dart';

class FilterCategory extends GetView<ProductListController> {
  const FilterCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pilih Kategori',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.categories.length,
                              itemBuilder: (context, index) {
                                String category = controller.categories[index];
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  title: Text(category),
                                  trailing: controller.selectedCategory.value ==
                                          category
                                      ? const Icon(Icons.check,
                                          color: Colors.green)
                                      : null,
                                  onTap: () {
                                    Navigator.pop(context);
                                    controller.onSelectCategory(category);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(controller.selectedCategory.value),
              ),
            ),
            Visibility(
              visible: controller.hasFilter,
              child: GestureDetector(
                onTap: controller.resetFilter,
                child: const Text('Hapus filter'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
