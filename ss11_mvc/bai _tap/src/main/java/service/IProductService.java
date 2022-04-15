package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> listProduct();

    void save(Product product);

    Product findById(Integer id);

    void update(Integer id, Product product);

    void remove(Integer id);
}
