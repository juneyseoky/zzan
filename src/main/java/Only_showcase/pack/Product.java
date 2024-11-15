package Only_showcase.pack;

public class Product {
    private String productName;
    private String price;
    private String description;
    private String imagePath;

    // 기본 생성자 추가
    public Product() {
    }

    public Product(String productName, String price, String description, String imagePath) {
        this.productName = productName;
        this.price = price;
        this.description = description;
        this.imagePath = imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
