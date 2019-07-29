package com.demo.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "typetemplate")
public class TypeTemplate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private boolean active;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "typeTemplate1")
	private List<Product> products1;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "typeTemplate2")
	private List<Product> products2;
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "typevalue_typetemplate", joinColumns = { @JoinColumn(name = "template_id") }, inverseJoinColumns = {
			@JoinColumn(name = "value_id") })
	private List<TypeValue> typeValues;

	public List<Product> getProducts1() {
		return products1;
	}

	public void setProducts1(List<Product> products1) {
		this.products1 = products1;
	}

	public List<Product> getProducts2() {
		return products2;
	}

	public void setProducts2(List<Product> products2) {
		this.products2 = products2;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
