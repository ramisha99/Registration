/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.lawrence.registration;

import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.shape.Polygon;

/**
 *
 * @author Ramisha Mahiyat
 */
public class CursorPane extends Pane {
    public static final int HANDLE_HEIGHT = 45;
    public static final int HANDLE_WIDTH = 30;
    public static final int PIXELS_PER_DAY = 1;
    
    public int position = 40;
    double oldHeight;
    
    int startingPosition = 0;
    
    ProviderPane providerPane;
    
    public CursorPane(ProviderPane pane) {
        this.setLayoutX(0);
        this.setLayoutY(0);
        this.setWidth(HANDLE_WIDTH);
        this.setPickOnBounds(false);
        this.providerPane = pane;
        
        this.setOnMousePressed(m -> { 
            startingPosition = (int)(m.getScreenX() - position); 
        });
        
        this.setOnMouseDragged(m -> { 
            setPosition((int)(m.getScreenX() - startingPosition)); 
        });
        repaint();
    }
    
    public void repaint() {
        this.getChildren().clear();
        Polygon handle = new Polygon();
        handle.getPoints().addAll(new Double[] 
        {
            position - (HANDLE_WIDTH / 2d), oldHeight,
            (double)position, (oldHeight - HANDLE_HEIGHT),
            position + (HANDLE_WIDTH / 2d), oldHeight
        } );
        handle.setFill(Color.BLUE);
        
        Line line = new Line();
        line.setStartY(0);
        line.setEndY(oldHeight - HANDLE_HEIGHT);
        line.setStartX(position);
        line.setEndX(position);
        this.getChildren().addAll(handle, line);
    }
    
    public int getPosition() { return position; }
    
    public void setPosition(int new_pos) {
        if (position != new_pos) {
            position = new_pos;
            providerPane.updateRegistrationCount(position);
            repaint();
        }
    }
    
    @Override
    public void setHeight(double height) {
        super.setHeight(height);
        
        height = height - 0.5; // fix
        
        if(height != oldHeight) {
            oldHeight = height;
            repaint();
        }
  }
    
    @Override
    public void setWidth(double width) {
        super.setWidth(width);
    }
}
