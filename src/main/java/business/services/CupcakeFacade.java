package business.services;

import business.entities.Cupcake;
import business.entities.Order;
import business.persistence.CupcakeMapper;
import business.persistence.Database;

public class CupcakeFacade {
    CupcakeMapper cupcakeMapper;

    public CupcakeFacade(Database database) {
        this.cupcakeMapper = new CupcakeMapper(database);
    }

    public void saveCupcakes(Order order){
        cupcakeMapper.saveCupcakes(order);
    }


}
