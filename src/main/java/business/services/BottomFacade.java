package business.services;

import business.entities.Bottom;
import business.entities.Topping;
import business.persistence.BottomMapper;
import business.persistence.Database;

import java.util.ArrayList;

public class BottomFacade {

    BottomMapper bottomMapper;

    public BottomFacade(Database database)
    {
        bottomMapper = new BottomMapper(database);
    }

    public Bottom saveBottom(String name, float price)
    {
        Bottom bottom = new Bottom(name, price);
        bottomMapper.saveBottom(bottom);
        return bottom;
    }

    public Bottom getBottom(String name) throws Exception {
        return bottomMapper.getBottom(name);
    }

    public ArrayList<Bottom> getAllBottoms() {
        try {
            return bottomMapper.getAllBottoms();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
