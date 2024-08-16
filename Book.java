package com.test.book;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Book {
	private int no;
	private String title;
	private String author;
	private String publisher;
	private java.sql.Date pubdate;
	private int pages;
	private int price;
	private String cover;
	private int qty;
	
	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}
	public boolean equals(Object obj) {
		Book other = (Book) obj;
		return this.no == other.no;
	}

	public Book() {}

	public Book(int no) {
		this.no = no;
	}
	public Book(int no, String title, String author, String publisher, Date pubdate, int pages, int price) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.pubdate = pubdate;
		this.pages = pages;
		this.price = price;
	}


	public Book(int no, String title, String author, String publisher, Date pubdate, int pages, int price,
			String cover) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.pubdate = pubdate;
		this.pages = pages;
		this.price = price;
		this.cover = cover;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public java.sql.Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(java.sql.Date pubdate) {
		this.pubdate = pubdate;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	
	
}
