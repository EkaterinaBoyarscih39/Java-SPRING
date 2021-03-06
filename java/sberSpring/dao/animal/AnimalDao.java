package sberSpring.dao.animal;

import sberSpring.model.animal.Animal;
import sberSpring.model.animal.sub.AnimalListCountTemplate;

import java.util.List;

public interface AnimalDao {
    void addAnimal(Animal animal);
    void updateAnimal(Animal animal);
    boolean removeAnimal(Long id) throws org.hibernate.ObjectNotFoundException;
    Animal getAnimalById(Long id) throws org.hibernate.ObjectNotFoundException;
    Animal getAnimalByArticle(String article) throws org.hibernate.ObjectNotFoundException;
    List<Animal> getAnimals();
    AnimalListCountTemplate getAnimals(Integer begin, Integer end);
    AnimalListCountTemplate getAnimalsBySubsidiary(Integer begin, Integer end, String subsidiaryName);
    AnimalListCountTemplate getAnimalsByType(Integer begin, Integer end, String typeName);
    List<Animal> getAnimalsOrderByDESC(Integer begin, Integer end);
    Long getCountRows();
}
