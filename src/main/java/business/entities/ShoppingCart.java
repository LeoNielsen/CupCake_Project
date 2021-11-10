package business.entities;

import java.util.ArrayList;

public class ShoppingCart {
    private ArrayList<Cupcake> cupcakes;
    private User user;

    public ShoppingCart(ArrayList<Cupcake> cupcakes, User user) {
        this.cupcakes = cupcakes;
        this.user = user;
    }

    public void add(Cupcake cupcake) {
        cupcakes.add(cupcake);
    }

    public void remove(Cupcake cupcake) {
        cupcakes.remove(cupcake);
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
}
