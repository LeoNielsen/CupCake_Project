package business.entities;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {
    private int id;
    private ArrayList<Cupcake> cupcakes;
    private User user;
    private String status;
    private Timestamp orderDate;
    private int totalItems;

    private float totalPrice;

    public Order(ArrayList<Cupcake> cupcakes, User user, String status, float totalPrice) {
        this.cupcakes = cupcakes;
        this.user = user;
        this.status = status;
        this.totalPrice = totalPrice;
        orderDate = new Timestamp(System.currentTimeMillis());
        this.totalItems = getTotalItems();
    }

    public Order(int id, ArrayList<Cupcake> cupcakes, User user, String status, Timestamp orderDate, float totalPrice) {
        this.id = id;
        this.cupcakes = cupcakes;
        this.user = user;
        this.status = status;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.totalItems = getTotalItems();
    }

    public void setTotalItems(int totalItems)
    {
        this.totalItems = totalItems;
    }

    public int getTotalItems()
    {
        int sum = 0;
        for (Cupcake cupcake : cupcakes)
        {
            sum += cupcake.getQuantity();

        }
        return sum;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(ArrayList<Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
}
