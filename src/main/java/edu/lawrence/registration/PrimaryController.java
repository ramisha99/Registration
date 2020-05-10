package edu.lawrence.registration;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;

public class PrimaryController  implements Initializable{

    @FXML
    private AnchorPane container;
    @FXML
    private Label parentName;
    @FXML
    private Label parentPhone;
    @FXML
    private TextField providerField;
    
    @FXML
    private Label selectedRegistrations;
    
    private ProviderPane pane;
    private DaycareDAO dao;
    
    @FXML
    private void SetProvider() {
        int provider = Integer.parseInt(providerField.getText());
        pane.setProvider(provider);
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        dao = new DaycareDAO();

        pane = new ProviderPane(dao,parentName,parentPhone, selectedRegistrations);

        AnchorPane.setTopAnchor(pane, 0.0);
        AnchorPane.setLeftAnchor(pane, 0.0);
        AnchorPane.setRightAnchor(pane, 0.0);
        AnchorPane.setBottomAnchor(pane, 0.0);
        container.getChildren().add(pane);
    }    
}
