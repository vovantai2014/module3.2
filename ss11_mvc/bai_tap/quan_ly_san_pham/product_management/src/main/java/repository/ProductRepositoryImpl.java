package repository;

import bean.Product;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository{
    private static Map<String, Product> productMap;
    static {
        productMap = new LinkedHashMap<>();
        productMap.put("SP001", new Product("SP001","Sam Sung A32",12000000.0f,"Cam ung van tay","Sam Sung VN"));
        productMap.put("SP002", new Product("SP002","Iphone 12 Plus",18500000.0f,"Chong nuoc","Apple USA"));
        productMap.put("SP003", new Product("SP003","Sure Face Tablet",22500000.0f,"Man hinh cam ung","Microsoft USA"));
        productMap.put("SP004", new Product("SP004","Dell Extra 11",27500000.0f,"Chip core i7","Dell China"));
        productMap.put("SP005", new Product("SP005","Cannon 14'",13000000.0f,"Zoom 100px","Cannon Japan"));
        productMap.put("SP006", new Product("SP006","Camera IP12'",1800000.0f,"Xoay 360 do","CPX Cam"));
    }

    @Override
    public void create(Product product) {
        if(!productMap.containsKey(product.getId())){
            productMap.put(product.getId(),product);
        }
    }

    @Override
    public void delete(String id) {
        productMap.remove(id);
    }

    @Override
    public void update(Product product) {
    if(productMap.containsKey(product.getId())){
        productMap.put(product.getId(),product);
    }
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(String id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> search(String name) {
        return null;
    }
}
