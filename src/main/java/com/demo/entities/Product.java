package com.demo.entities;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @NotNull
    private String name;
    
    @NotNull
    private double price;
    private int quantity;
    
    @Column(name = "free_size")
    private boolean freeSize; 
	private boolean status;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "product_color", 
			joinColumns = { @JoinColumn(name = "productid") }, 
			inverseJoinColumns = { @JoinColumn(name = "colorid") })
	private List<Color> colors;
    
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "product_size", 
			joinColumns = { @JoinColumn(name = "productid") }, 
			inverseJoinColumns = { @JoinColumn(name = "sizeid") })
    private List<Size> sizes;

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "category_product", 
			joinColumns = { @JoinColumn(name = "productid") }, 
			inverseJoinColumns = { @JoinColumn(name = "categoryid") })
    private List<Category> categories;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	private List<Image> images;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public List<Color> getColors() {
		return colors;
	}

	public void setColors(List<Color> colors) {
		this.colors = colors;
	}

	public boolean isFreeSize() {
		return freeSize;
	}

	public void setFreeSize(boolean freeSize) {
		this.freeSize = freeSize;
	}

	public List<Size> getSizes() {
		return sizes;
	}

	public void setSizes(List<Size> sizes) {
		this.sizes = sizes;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}