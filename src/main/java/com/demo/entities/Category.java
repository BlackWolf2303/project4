package com.demo.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy = "categories")
	private List<Product> products;
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "parentid")
	private Category category;
	@OneToMany(mappedBy = "category")
	private List<Category> categories;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> product) {
		this.products = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
