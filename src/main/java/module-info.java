module edu.lawrence.registration {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    
    opens edu.lawrence.registration to javafx.fxml;
    exports edu.lawrence.registration;
}