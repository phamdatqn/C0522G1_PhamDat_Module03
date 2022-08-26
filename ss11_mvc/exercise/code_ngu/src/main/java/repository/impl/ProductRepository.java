package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> productList=new HashMap<>();
    static {
        productList.put(1,new Product(1,"bánh 1",20000,"hạn dùng 6 tháng","vinafood"));
        productList.put(2,new Product(2,"bánh 2",20000,"hạn dùng 6 tháng","vinafood"));
        productList.put(3,new Product(3,"bánh 3",20000,"hạn dùng 6 tháng","vinafood"));
        productList.put(4,new Product(4,"kẹo 1",20000,"hạn dùng 6 tháng","vinafood"));
    }
    @Override
    public List<Product> displayAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public Product findById(int id) {
        Set<Integer>keyList=productList.keySet();
        for (Integer num:keyList) {
            if (productList.get(num).getId()==id){
                return productList.get(num);
            }

        }
        return null;
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> findName(String name) {
        List<Product>products=new ArrayList<>();
        Set<Integer>keyList=productList.keySet();
        for (Integer num:keyList) {
            if (productList.get(num).getName().contains(name)){
                    products.add(productList.get(num));
            }
        }
        return products;
    }

    @Override
    public void update(int id, Product product) {
    productList.put(product.getId(),product);
    }
}
