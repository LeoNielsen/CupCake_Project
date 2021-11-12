package business.entities;

public class Cupcake {
    private Topping topping;
    private Bottom bottom;
    private float price;
    private float total;
    private int quantity;

    public Cupcake(Topping topping, Bottom bottom, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.quantity = quantity;
        price = topping.getPrice() + bottom.getPrice();
        total = price * quantity;
    }

    public Cupcake(int id, Bottom bottom, Topping topping, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.price = topping.getPrice() + bottom.getPrice();
        this.quantity = quantity;
        this.total = price * quantity;
    }

    public Topping getTopping() {
        return topping;
    }

    public void setTopping(Topping topping) {
        this.topping = topping;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public void setBottom(Bottom bottom) {
        this.bottom = bottom;
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

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
}
