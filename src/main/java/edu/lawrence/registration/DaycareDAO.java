package edu.lawrence.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joe Gregg
 */
public class DaycareDAO {
    private Connection connection;
    private String selectSQL = "select id, parent, phone, child, start, end, status from regdata where provider=?";
    private PreparedStatement selectStmt;
    private String updateSQL = "update registration set status=? where id=?";
    private PreparedStatement updateStmt;
    
    // The constructor opens the database connection
    public DaycareDAO() {
        // Load the database driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Could not load database driver.");
        }
        // Open the connection and set up statements
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/daycare?user=student&password=cmsc250!");
            selectStmt = connection.prepareStatement(selectSQL);
            updateStmt = connection.prepareStatement(updateSQL);
        } catch (SQLException ex) {
            System.out.println("Could not connect to database.");
            ex.printStackTrace();
        }

    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    // Locate all of the registrations for the given provider
    public List<Registration> getRegistrations(int provider) {
        ArrayList<Registration> result = new ArrayList<Registration>();
        try {
            selectStmt.setInt(1, provider);
            ResultSet rset = selectStmt.executeQuery();
            while(rset.next()) {
                Registration r = new Registration();
                r.setId(rset.getInt(1));
                r.setParent(rset.getString(2));
                r.setPhone(rset.getString(3));
                r.setChild(rset.getString(4));
                r.setStart(rset.getDate(5).toLocalDate());
                r.setEnd(rset.getDate(6).toLocalDate());
                r.setProvider(provider);
                r.setStatus(rset.getInt(7));
                result.add(r);
            }
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    // Cycle the status for the given registration
    public void advanceStatus(Registration r) {
        int newStatus = 1;
        if(r.getStatus() < 3) 
            newStatus = r.getStatus() + 1;
        try {
            updateStmt.setInt(1, newStatus);
            updateStmt.setInt(2, r.getId());
            updateStmt.execute();
            r.setStatus(newStatus);
        } catch(SQLException ex) {
            ex.printStackTrace();
        }
    }
}
