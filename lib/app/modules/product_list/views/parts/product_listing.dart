part of '../product_list_view.dart';

class ProductListing extends GetView<ProductListController> {
  const ProductListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ProductListController>(
        builder: (_) {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.isError.isTrue) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Error occurred when get data',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: controller.initList,
                    child: const Text('Refresh'),
                  )
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: controller.products.map((element) {
                  return ProductItem(element);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
