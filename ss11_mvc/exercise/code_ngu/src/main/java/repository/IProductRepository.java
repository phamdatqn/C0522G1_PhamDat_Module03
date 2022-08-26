package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> displayAll();
    Product findById(int id);
    void delete(int id);
    List<Product> findName(String name);
    void update(int id,Product product);
}
