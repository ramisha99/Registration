package edu.lawrence.registration;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;

/**
 *
 * @author Joe Gregg
 */
public class ProviderPane extends Pane {
    private Label parentName;
    private Label parentPhone;
    private DaycareDAO dao;
    List<Registration> registrations;
    double oldHeight;
    
    private CursorPane cursorPane;
    
    private Label selectedRegistrations;
    
    public ProviderPane(DaycareDAO dao,Label parentName,Label parentPhone, Label selectedRegistrations) {
        this.dao = dao;
        this.parentName = parentName;
        this.parentPhone = parentPhone;
        this.selectedRegistrations = selectedRegistrations;
        registrations = null;
        oldHeight = 0.0;
        
        cursorPane = new CursorPane(this);
    }
    
    public void setProvider(int p) {
        registrations = dao.getRegistrations(p);
        
        updateRegistrationCount(cursorPane.getPosition());
        repaint();
    }
    
    public void updateRegistrationCount(int position) {
                int count = 0;
        
        if (registrations != null) {
            for(int n = 0; n < registrations.size();n++) {
                Registration r = registrations.get(n);
                LocalDate now = LocalDate.now();
                long days = now.until(r.getStart(),ChronoUnit.DAYS);
                long end = now.until(r.getEnd(), ChronoUnit.DAYS);
                
                if ((days < position) && position < end)
                    count++;
            }
        }
        
        selectedRegistrations.setText(Integer.toString(count));
    }
    
    private void repaint() {
        this.getChildren().clear();
        if(registrations != null) {
            for(int n = 0;n < registrations.size();n++) {
                RegistrationPane pane = new RegistrationPane(registrations.get(n),n);
                pane.setOnMousePressed((evt)->clickPane(evt,pane));
                this.getChildren().add(pane);
            }
        }
        
        this.getChildren().add(cursorPane);
    }
    
    private void clickPane(MouseEvent event,RegistrationPane pane) {
        Registration r = pane.getRegistration();
        if(event.isPrimaryButtonDown()) {
            parentName.setText(r.getParent());
            parentPhone.setText(r.getPhone());
        } else {
            dao.advanceStatus(r);
            pane.refresh();
        }
    }
  
  @Override
  public void setHeight(double height) {
    super.setHeight(height);
    cursorPane.setHeight(height);
    if(height != oldHeight) {
        oldHeight = height;
        repaint();
    }
  }
}
