package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product customer);

    List<Product> findName(String name);

    Product findById(int id);

    void update(int id, Product customer);

    void remove(int id);
}
