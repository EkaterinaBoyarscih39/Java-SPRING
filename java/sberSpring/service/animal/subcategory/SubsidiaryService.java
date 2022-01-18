package sberSpring.service.animal.subcategory;

import sberSpring.model.animal.subcategory.Subsidiary;

import java.util.List;

public interface SubsidiaryService {
    void addSubsidiary(Subsidiary subsidiary);
    void updateSubsidiary(Subsidiary subsidiary);
    boolean removeSubsidiary(Long id);
    Subsidiary getSubsidiary(Long id);
    List<Subsidiary> getSubsidiaries();
}
