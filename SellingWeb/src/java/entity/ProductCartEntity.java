/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Đỗ Trung Đức
 */
public class ProductCartEntity extends ProductEntity {
    
    int quantityInCart;

    public ProductCartEntity(int quantityInCart) {
        this.quantityInCart = quantityInCart;
    }

    public ProductCartEntity(int quantityInCart, String id, String name, int quantity, float price, String pricture) {
        super(id, name, quantity, price, pricture);
        this.quantityInCart = quantityInCart;
    }

    public int getQuantityInCart() {
        return quantityInCart;
    }

    public void setQuantityInCart(int quantityInCart) {
        this.quantityInCart = quantityInCart;
    }
    
    
}
