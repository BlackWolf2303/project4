package com.demo.model;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.ISBN;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Image;
import com.demo.entities.TypeTemplate;

public class ProductModel {

	private int id;
	@Length(min = 3, max = 250)
	private String name;
	@NotNull
	@Range(min = 0, max = 1000000)
	private String price;
	@NotNull
	@Range(min = 0, max = 50)
	private String quantity;
	private boolean active;
	private String picture0;
	private String picture1;
	private String picture2;
	private String picture3;
	private String picture4;
	private String picture5;
	private String picture6;
	private String picture7;
	private MultipartFile[] file;
	private List<Image> images;
	private TypeTemplate typeTemplate1;
	private TypeTemplate typeTemplate2;

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;
	}

	public String getPicture0() {
		return picture0;
	}

	public void setPicture0(String picture0) {
		this.picture0 = picture0;
	}

	public String getPicture1() {
		return picture1;
	}

	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}

	public String getPicture2() {
		return picture2;
	}

	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}

	public String getPicture3() {
		return picture3;
	}

	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}

	public String getPicture4() {
		return picture4;
	}

	public void setPicture4(String picture4) {
		this.picture4 = picture4;
	}

	public String getPicture5() {
		return picture5;
	}

	public void setPicture5(String picture5) {
		this.picture5 = picture5;
	}

	public String getPicture6() {
		return picture6;
	}

	public void setPicture6(String picture6) {
		this.picture6 = picture6;
	}

	public String getPicture7() {
		return picture7;
	}

	public void setPicture7(String picture7) {
		this.picture7 = picture7;
	}

	public TypeTemplate getTypeTemplate1() {
		return typeTemplate1;
	}

	public void setTypeTemplate1(TypeTemplate typeTemplate1) {
		this.typeTemplate1 = typeTemplate1;
	}

	public TypeTemplate getTypeTemplate2() {
		return typeTemplate2;
	}

	public void setTypeTemplate2(TypeTemplate typeTemplate2) {
		this.typeTemplate2 = typeTemplate2;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

}
