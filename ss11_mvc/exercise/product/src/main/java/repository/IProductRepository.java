package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void save(Product customer);
    List<Product> findName(String name);
    Product findById(int id);
    void update(int id,Product customer);
    void  remove(int id);
}
