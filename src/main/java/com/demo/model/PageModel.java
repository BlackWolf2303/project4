package com.demo.model;

import org.springframework.data.domain.Page;

public class PageModel<T> {
	private Page<T> pages;

	public Page<T> getPages() {
		return pages;
	}

	public void setPages(Page<T> pages) {
		this.pages = pages;
	}
	
}
