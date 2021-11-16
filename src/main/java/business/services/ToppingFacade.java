package business.services;

import business.entities.Topping;
import business.persistence.Database;
import business.persistence.ToppingMapper;

import java.util.ArrayList;

public class ToppingFacade {

    ToppingMapper toppingMapper;

    public ToppingFacade(Database database){
        toppingMapper = new ToppingMapper(database);
    }

    public Topping saveTopping(String name, Float price){
        Topping topping = new Topping(name, price);
        toppingMapper.saveTopping(topping);
        return topping;
    }

    public Topping getTopping(String name) throws Exception {
        return toppingMapper.getToppping(name);
    }

    public ArrayList<Topping> getAllToppings() {
        try {
            return toppingMapper.getAllToppings();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
