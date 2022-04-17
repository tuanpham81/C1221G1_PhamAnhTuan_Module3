package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "car", 10000, "new", "Honda"));
        products.put(2, new Product(2, "book", 10000, "new", "Kim Dong"));
        products.put(3, new Product(3, "tank", 10000, "new", "Vinfast"));
        products.put(4, new Product(4, "BTS", 1, "trash", "NA"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    //    @Override
//    public void update(int id, Product product) {
//        products.put(id, product);
//    }
    @Override
    public void update(int id, String name, int price, String description, String brand, Product product) {
        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setBrand(brand);
        products.put(id, product);
    }


    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product product : products.values())
            if(product.getName().contains(name)){
                searchList.add(product);
            }
        return searchList;
    }
}

