package com.learn.online_shopping.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.online_shopping.entites.Category;
import com.learn.online_shopping.entites.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
    public boolean saveProduct(Product product)
    { 
    	boolean f = false;
    	try {
    		
    		
    		Session session = this.factory.openSession();
    		 Transaction tx = session.beginTransaction();
    		 session.save(product);
    		 
    		 tx.commit();
    		 session.close();
    		 f=false;
    		
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return f;
    }
    
       //get all products
    public List<Product> getAllProducts(){
    	Session s = this.factory.openSession();
    	 Query query = s.createQuery("from Product");
    	List<Product> list = query.list();
    	return list;
    }
    //get all products of given category
    public List<Product> getAllProductsById(int cid){
    	Session s = this.factory.openSession();
    	 Query query = s.createQuery("from Product as p where p.category.categoyId =: id");
    	 query.setParameter("id",cid);
    	List<Product> list = query.list();
    	return list;
    }
    
    public Product getProductById(int pi) {
        long pid = (long)pi;
    	Product dbEmployee = null;
        Session session = this.factory.getCurrentSession();
         
        try {
            session.beginTransaction();
             
             dbEmployee = (Product) session.get(Product.class, pid);
            System.out.println(dbEmployee.getpId() + " - " + dbEmployee.getpName());
             
            session.getTransaction().commit();
        }
        catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return dbEmployee;
    }
	public List<Product> getByCategory(String keyword) {
		List<Product> ansList = new ArrayList<>();
		Session s = this.factory.openSession();
	   	Query query = s.createQuery("from Product");
	   	List<Product> list = query.list();
	   	System.out.print("List" + list.toString());
//	   	for(Product p : list) {
//	   		if(p.c)
//	   	}
//	   	if(list.contains(keyword))
//	   		ansList.add(null)
	   	return list;
	}
}


