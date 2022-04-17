package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, String name, int price, String description, String brand, Product product);

    void remove(int id);

    List<Product> search(String name);
}
