package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String options;
    private String vendor;


    public Product() {
    }

    public Product(int id, String name, double price, String options, String vendor) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.options = options;
        this.vendor = vendor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }
}
