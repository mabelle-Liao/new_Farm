package com.donkeycar.bean;
import java.io.Serializable;
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	
    private String username;
    private String useraccount;
    private String password;
    private String address;
    private String contact;
    
    public User() {
    }
    
    public User(String username, String useraccount, 
    		String password, String address, String contact) {
    	this.username = username;
        this.useraccount = useraccount;
        this.password = password;
        this.address = address;
        this.contact = contact;
    }

    public User(String username, String useraccount, String password) {
    	this.username = username;
        this.useraccount = useraccount;
        this.password = password;
    }
    
    public User(String useraccount, String password) {
        this.useraccount = useraccount;
        this.password = password;
    }
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseraccount() {
		return useraccount;
	}
	public void setUseraccount(String useraccount) {
		this.useraccount = useraccount;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
    
    
}
