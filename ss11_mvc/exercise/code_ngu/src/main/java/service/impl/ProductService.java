package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
   private static IProductRepository iProductRepository=new ProductRepository();
    @Override
    public List<Product> displayAll() {
        return iProductRepository.displayAll();
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public void delete(int id) {
        iProductRepository.delete(id);
    }

    @Override
    public List<Product> findName(String name) {
        return iProductRepository.findName(name);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id,product);
    }
}
