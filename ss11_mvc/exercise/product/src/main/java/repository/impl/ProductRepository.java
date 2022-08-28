package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        productList.put(1, new Product(1, "Bánh Chocopice", 24000, "Hạn dùng 6 tháng", "Vina Food"));
        productList.put(2, new Product(2, "Kẹo bạc hà hạt nhân", 23000, "Hạn dùng 6 tháng", "Vina Food"));
        productList.put(3, new Product(3, "Kẹo ổi", 5000, "Hạn dùng 12 tháng", "Vina Food"));
        productList.put(4, new Product(4, "Bánh tráng dừa", 30000, "Hạn dùng 6 tháng", "Vina Food"));
        productList.put(5, new Product(5, "Bánh Nabutri", 12000, "Hạn dùng 12 tháng", "Vina Food"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public List<Product> findName(String name) {
        List<Product> products = new ArrayList<>();
        Set<Integer> keyList = productList.keySet();
        for (Integer key : keyList) {
            if (productList.get(key).getName().toLowerCase().contains(name.toLowerCase())) {
                products.add(productList.get(key));
            }
        }
        return products;
    }

    @Override
    public Product findById(int id) {
       return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }
}
