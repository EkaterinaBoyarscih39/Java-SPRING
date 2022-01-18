package sberSpring.validator.product;

import sberSpring.model.product.Product;
import sberSpring.service.product.ProductService;
import sberSpring.validator.other.AddressValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProductValidator implements Validator {
    private ProductService productService;
    private AddressValidator addressValidator;

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public void setAddressValidator(AddressValidator addressValidator) {
        this.addressValidator = addressValidator;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        this.validate(target, errors, "");
    }

    public Product validate(Object target, Errors errors, String property) {
        Product product = (Product) target;

        if (property.length() > 0) property = property + ".";

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, property + "name", "Field.notEmpty");
        if (product.getAddress() != null)
            addressValidator.validate(product.getAddress(), errors, property + "address");

        return product;
    }

    public Product validate(Object target, Errors errors, String property, int step) {
        Product product = (Product) target;

        if (product.getId() != null) {
            try {
                product = productService.getProductById(product.getId());
            } catch (org.hibernate.ObjectNotFoundException e) {
                errors.rejectValue(property + "[" + step + "].id", "NotExist.entity.id");
                return null;
            }
        }
        return product;
    }
}

