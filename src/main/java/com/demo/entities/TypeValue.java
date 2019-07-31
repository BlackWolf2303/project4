package com.demo.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "typevalue")
public class TypeValue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "typevalue_typetemplate", joinColumns = {
			@JoinColumn(name = "value_id") }, inverseJoinColumns = { @JoinColumn(name = "template_id") })
	private List<TypeTemplate> typeTemplates;

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

	public List<TypeTemplate> getTypeTemplates() {
		return typeTemplates;
	}

	public void setTypeTemplates(List<TypeTemplate> typeTemplates) {
		this.typeTemplates = typeTemplates;
	}

}
