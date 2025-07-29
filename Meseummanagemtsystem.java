package demo;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;
import java.util.Vector;

public class projectflight extends JFrame {
    private JComboBox<String> databaseSelector;
    private JComboBox<String> tableSelector;
    private JTable dataTable;
    private DefaultTableModel tableModel;

    private String DB_USER;
    private String DB_PASSWORD;

    // Table sets
    private final String[] jayantTables = {"Exhibits", "Staffs", "Maintenance"};
    private final String[] visitorTables = {"tourists", "researchers", "research_team_members"};
    private final String[] EmployeesTables= {"museum_head","staff_committee","object_management_staff","security_staff","caretaking_staff"};

    public projectflight(String user, String password) {
        this.DB_USER = user;
        this.DB_PASSWORD = password;

        setTitle("🖼️ National Museum e-view");
        setSize(800, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // UI Components
        databaseSelector = new JComboBox<>(new String[]{"jayant", "visitor","Employees"});
        tableSelector = new JComboBox<>();
        updateTableSelector("jayant"); // Set initial tables for "jayant"

        JButton loadButton = new JButton("Load Data");
        JButton headButton=new JButton("Heads");

        tableModel = new DefaultTableModel();
        dataTable = new JTable(tableModel);

        JPanel topPanel = new JPanel();
        topPanel.add(new JLabel("Select Database:"));
        topPanel.add(databaseSelector);
        topPanel.add(new JLabel("Select Table:"));
        topPanel.add(tableSelector);
        topPanel.add(loadButton);
        topPanel.add(headButton);
        
        headButton.addActionListener(e -> {
            showMuseumHeads();
        });

        

        add(topPanel, BorderLayout.NORTH);
        add(new JScrollPane(dataTable), BorderLayout.CENTER);

        // Event Listener: Update table list on DB selection
        databaseSelector.addActionListener(e -> {
            String selectedDB = (String) databaseSelector.getSelectedItem();
            updateTableSelector(selectedDB);
        });

        // Load Data Button Action
        loadButton.addActionListener(e -> {
            String selectedTable = (String) tableSelector.getSelectedItem();
            if (selectedTable != null) {
                loadData(selectedTable);
            }
        });
    }
    private void showMuseumHeads() {
        try (Connection conn = DriverManager.getConnection(getSelectedDBUrl(), DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT name, contact_number FROM staff WHERE role = 'Head of Museum'")) {

            // Clear existing data
            tableModel.setRowCount(0);
            tableModel.setColumnCount(0);

            // Set column headers
            tableModel.addColumn("Head Name");
            tableModel.addColumn("Contact Number");

            // Fill table
            while (rs.next()) {
                String name = rs.getString("name");
                String contact = rs.getString("contact_number");
                tableModel.addRow(new Object[]{name, contact});
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this,
                    "❌ Error loading museum head(s): " + ex.getMessage(),
                    "Database Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    

    // 🔁 Helper method to update table list
    private void updateTableSelector(String database) {
        tableSelector.removeAllItems();
        String[] tables;
        //update tables based on database values 
        if("visitor".equals(database)) {
        	tables=visitorTables;
        }
        else if("Employees".equals(database)){
        	tables=EmployeesTables;
        }
        else {
        	tables=jayantTables;
        }
        for (String table : tables) {
            tableSelector.addItem(table);
        }
        
    }

    private String getSelectedDBUrl() {
        String selectedDB = (String) databaseSelector.getSelectedItem();
        return "jdbc:mysql://localhost:3306/" + selectedDB;
    }

    private void loadData(String tableName) {
        try (Connection conn = DriverManager.getConnection(getSelectedDBUrl(), DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM " + tableName)) {

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            // Clear existing data
            tableModel.setRowCount(0);
            tableModel.setColumnCount(0);

            // Set column names
            for (int i = 1; i <= columnCount; i++) {
                tableModel.addColumn(metaData.getColumnLabel(i));
            }

            // Add data rows
            while (rs.next()) {
                Object[] rowData = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {
                    rowData[i - 1] = rs.getObject(i);
                }
                tableModel.addRow(rowData);
            }

        } catch (SQLException ex) {
            String errorMessage = ex.getMessage();
            if (errorMessage.contains("doesn't exist")) {
                JOptionPane.showMessageDialog(this,
                        "⚠️ Table not found!\nIt seems the selected table doesn't exist in the selected database.\n\n⛔ You are not allowed to access this resource or it hasn't been created yet.",
                        "Access Denied / Table Missing", JOptionPane.WARNING_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this,
                        "❌ Failed to load data from table: " + tableName + "\n" + errorMessage,
                        "Database Error", JOptionPane.ERROR_MESSAGE);
            }
        }
       finally {
    	   System.out.println("Thankyou ");
       }
    }

    // 🟡 Login Window Method
    public static void showLoginWindow() {
        JTextField userField = new JTextField();
        JPasswordField passField = new JPasswordField();

        Object[] message = {
                "Username:", userField,
                "Password:", passField
        };

        int option = JOptionPane.showConfirmDialog(null, message, "Login to MySQL", JOptionPane.OK_CANCEL_OPTION);
        if (option == JOptionPane.OK_OPTION) {
            String user = userField.getText();
            String pass = new String(passField.getPassword());

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", user, pass)) {
                JOptionPane.showMessageDialog(null, "✅ Login Successful!", "Success", JOptionPane.INFORMATION_MESSAGE);
                SwingUtilities.invokeLater(() -> new projectflight(user, pass).setVisible(true));
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "❌ Incorrect username or password.\nPlease try again.", "Login Failed", JOptionPane.ERROR_MESSAGE);
                showLoginWindow();  // Retry on failure
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(projectflight::showLoginWindow);
    }
}
