package edu.lawrence.registration;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;

/**
 *
 * @author Joe Gregg
 */
public class RegistrationPane extends Pane {
    public static final int PIXELS_PER_DAY = 1;
    public static final int REGISTRATION_HEIGHT = 20;

    private Registration r;
    
    public RegistrationPane(Registration r,int n) {
        this.r = r;
        LocalDate now = LocalDate.now();
        long days = now.until(r.getStart(),ChronoUnit.DAYS);
        long duration = r.getStart().until(r.getEnd(), ChronoUnit.DAYS);
        this.setLayoutX(days*PIXELS_PER_DAY);
        this.setWidth(duration*PIXELS_PER_DAY);
        this.setHeight(REGISTRATION_HEIGHT);
        this.setLayoutY(n*REGISTRATION_HEIGHT);
        refresh();
    }
    
    public Registration getRegistration() { return r; }
    
    public void refresh() {
        this.getChildren().clear();
        Text name = new Text(5,12,r.getChild());
        Rectangle border = new Rectangle(0,0,this.getWidth(),this.getHeight());
        if(r.getStatus() == 1)
            border.setFill(Color.WHITE);
        else if(r.getStatus() == 2)
            border.setFill(Color.GREEN);
        else
            border.setFill(Color.RED);
        border.setStroke(Color.BLACK);
        this.getChildren().addAll(border,name);
    }
    
    // Panes are all resizeable, so we need to override this method
    // to keep the dimensions of our registration panes fixed.
    @Override
    public boolean isResizable() {
        return false;
    }  
}
