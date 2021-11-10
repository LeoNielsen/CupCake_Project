package business.services;

import business.entities.Topping;
import business.persistence.Database;
import business.persistence.ToppingMapper;

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


}
