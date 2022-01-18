package sberSpring.controller.admin;

import sberSpring.model.user.Client;
import sberSpring.model.user.Worker;
import sberSpring.service.animal.AnimalService;
import sberSpring.service.product.ProductService;
import sberSpring.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private AnimalService animalService;
    private UserService<Client> clientService;
    private UserService<Worker> workerService;
    private ProductService productService;

    @Autowired
    public void setAnimalService(AnimalService animalService) {
        this.animalService = animalService;
    }
    @Autowired
    public void setClientService(UserService<Client> clientService) {
        this.clientService = clientService;
    }
    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
    @Autowired
    public void setWorkerService(UserService<Worker> workerService) {
        this.workerService = workerService;
    }

    @GetMapping("/panel")
    public String panel(ModelMap model) {
        model.addAttribute("animalTheLastTen", animalService.getAnimalsOrderByDESC(0, 10));
        model.addAttribute("clientTheLastTen", clientService.getUsersOrderByDESC(0, 10));
        model.addAttribute("workers", workerService.getUsers());
        model.addAttribute("productTheLastTen", productService.getProductsOrderByDESC(0, 10));
        return "admin/panel";
    }

}
