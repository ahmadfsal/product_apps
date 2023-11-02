part of '../product_list_view.dart';

class ProductItem extends GetView<ProductListController> {
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  final ProductListEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              fit: BoxFit.fill,
              errorWidget: (context, string, _) {
                return Icon(
                  Icons.image_not_supported_rounded,
                  size: MediaQuery.of(context).size.height / 8,
                  color: Colors.grey,
                );
              },
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    SharedHelper.formatRupiah(product.price),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Brand',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    const Text(':'),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        product.brand,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Category',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    const Text(':'),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        product.category,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(
                  product.rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 4.0),
                const Text(
                  '|',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 4.0),
                Flexible(
                  child: Text(
                    'Tersedia: ${product.stock}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
