package service;

import model.Product;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ProductServiceImpl implements IProductService {
    private static Map<Integer, Product> products = new HashMap<>();
    static {
        products.put(1,new Product(1,"car", 10000, "new", "Honda"));
        products.put(2,new Product(2,"book", 10000, "new", "Kim Dong"));
        products.put(3,new Product(3,"tank", 10000, "new", "Vinfast"));
        products.put(4,new Product(4,"BTS", 1, "trash", "NA"));
    }

    @Override
    public List<Product> listProduct() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(Integer id) {
        return products.get(id);
    }

    @Override
    public void update(Integer id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(Integer id) {
        products.remove(id);
    }
}
