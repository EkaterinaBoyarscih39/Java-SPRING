package sberSpring.dao.animal.subcategory;

import sberSpring.model.animal.subcategory.Type;

import java.util.List;

public interface TypeDao {
    void addType(Type type);
    void updateType(Type type);
    boolean removeType(Long id);
    Type getType(Long id);
    List<Type> getTypes();
}
