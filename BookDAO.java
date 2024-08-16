package com.test.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

	 private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   
	   private Connection getConn() 
	   {
	      try {
	         Class.forName("oracle.jdbc.OracleDriver");
	         conn = DriverManager.getConnection(
	                   "jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
	         return conn;
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	      
	   }
	   
	public List<Book> getBooks(){	// 그림 빼고 다
		conn = getConn();
		String sql = "SELECT * FROM book";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Book> list = new ArrayList<>();
			while(rs.next()) {
				int no = rs.getInt("NO");
				String title = rs.getString("TITLE");
				String author = rs.getString("AUTHOR");
				String publisher = rs.getString("PUBLISHER");
				java.sql.Date pubdate = rs.getDate("PUBDATE");
				int pages = rs.getInt("PAGES");
				int price = rs.getInt("PRICE");
			
				
				Book book = new Book(no,title,author,publisher,pubdate,pages,price);
				list.add(book);
			}
			return list;
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			closeAll();
		}
		return null;
	}
	
	public Book getBook(int no) {
		conn = getConn();
		String sql = "SELECT * FROM book WHERE no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int nos = rs.getInt("NO");
				String title = rs.getString("TITLE");
				String author = rs.getString("AUTHOR");
				String pubisher = rs.getString("PUBLISHER");
				java.sql.Date pubdate = rs.getDate("PUBDATE");
				int pages = rs.getInt("PAGES");
				int price =  rs.getInt("PRICE");
				String cover = rs.getString("COVER");
				
				Book book = new Book(nos,title,author,pubisher,pubdate,pages,price,cover);
				return book;
			}
			
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			closeAll();
		}
		return null;
	}
	
	public Book bookDetail(Book b) {
		conn = getConn();
		String sql = "SELECT * FROM book WHERE no=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getNo());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				b.setTitle(rs.getString("TITLE"));
				b.setAuthor(rs.getString("AUTHOR"));
				b.setPublisher(rs.getString("PUBLISHER"));
				b.setPubdate(rs.getDate("PUBDATE"));
				b.setPages(rs.getInt("PAGES"));
				b.setPrice(rs.getInt("PRICE"));
				b.setCover(rs.getString("COVER"));
								
				return b;
			}
			
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			closeAll();
		}
		return null;
	}
	
	 private void closeAll() {
	      try {
	         if(rs!=null) rs.close();
	         if(pstmt!=null) pstmt.close();
	         if(conn!=null) conn.close();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }

}
