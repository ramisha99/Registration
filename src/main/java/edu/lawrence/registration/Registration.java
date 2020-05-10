package edu.lawrence.registration;

import java.time.LocalDate;

/**
 *
 * @author Joe Gregg
 */
public class Registration {
    private int id;
    private String parent;
    private String phone;
    private String child;
    private LocalDate start;
    private LocalDate end;
    private int provider;
    private int status;
    
    public Registration() {}
    
    public int getId() { 
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getChild() {
        return child;
    }

    public void setChild(String child) {
        this.child = child;
    }

    public LocalDate getStart() {
        return start;
    }

    public void setStart(LocalDate start) {
        this.start = start;
    }

    public LocalDate getEnd() {
        return end;
    }

    public void setEnd(LocalDate end) {
        this.end = end;
    }

    public int getProvider() {
        return provider;
    }

    public void setProvider(int provider) {
        this.provider = provider;
    }   
    
    public int getStatus() {
        return this.status;
    }
    
    public void setStatus(int status) {
        this.status = status;
    }
    
    public boolean containsDate(LocalDate date) {
        if(date.isBefore(start) || date.isAfter(end))
            return false;
        return true;            
    }
}
