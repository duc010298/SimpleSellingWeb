package entity;

import java.sql.Date;

public class ProductEntity {

    private String id;
    private  String name;
    private  int quantity;
    private float price;
    private String pricture;
    private String description;
    private int status;
    private Date lastmodifier;

    public ProductEntity() {
    }

    public ProductEntity(String id, String name, int quantity, float price, String pricture, String description, int status, Date lastmodifier) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.pricture = pricture;
        this.description = description;
        this.status = status;
        this.lastmodifier = lastmodifier;
    }
    
    public ProductEntity(String id, String name, int quantity, float price, String pricture, String description, int status) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.pricture = pricture;
        this.description = description;
        this.status = status;
    }

    public ProductEntity(String id, String name, int quantity, float price, String pricture, String description) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.pricture = pricture;
        this.description = description;
    }

    public ProductEntity(String id, String name, int quantity, float price, String pricture) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.pricture = pricture;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPricture() {
        return pricture;
    }

    public void setPricture(String pricture) {
        this.pricture = pricture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getLastmodifier() {
        return lastmodifier;
    }

    public void setLastmodifier(Date lastmodifier) {
        this.lastmodifier = lastmodifier;
    }

    
}
