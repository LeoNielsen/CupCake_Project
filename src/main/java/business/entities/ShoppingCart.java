package business.entities;

import java.util.ArrayList;

public class ShoppingCart {
    private ArrayList<Cupcake> cupcakes;
    private User user;
    private float total;

    public ShoppingCart( User user) {
        cupcakes = new ArrayList<>();
        this.user = user;
        total = calculateTotal();
    }

    private float calculateTotal() {
        float i = 0;
        for (Cupcake cupcake : cupcakes) {
            i+=cupcake.getTotal();
        }
        return i;
    }

    public ShoppingCart() {
        cupcakes = new ArrayList<>();
        user = null;
    }

    public void add(Cupcake cupcake) {
        cupcakes.add(cupcake);
        total+=cupcake.getTotal();
    }

    public void remove(Cupcake cupcake) {
        cupcakes.remove(cupcake);
        total-=cupcake.getTotal();
    }
    public void remove(int idx) {
        Cupcake cupcake = cupcakes.get(idx);
        total-=cupcake.getTotal();
        cupcakes.remove(idx);
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

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
}
