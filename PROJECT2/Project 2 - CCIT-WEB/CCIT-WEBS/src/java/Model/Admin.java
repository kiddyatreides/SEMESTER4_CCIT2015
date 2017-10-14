/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import Config.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Badrus
 */
public class Admin {
    Database Koneksi = new Database();
    
    private String AdminUsername;
    private String AdminPassword;
    private String CategoryID;
    private String Category;
    private String Descriptions;
    private String EDescriptions;
    private String PostID;
    private String Texts; 
    private String Title; 
    private String AdminID; 
    private String Photo;
    private String NIM;
    private String Name;
    private String PhoneNumber;
    private String Semester;
    private String Date_of_Birth;
    private String Gender;
    private String Address;
    private String Academic_Year;
    private String UserID;
    private String UserPassword;
    private String IDFacultyEfalema;
    private String Question;
    private String Value;
    private String Critism;
    private String Suggestion;

    public String getIDFacultyEfalema() {
        return IDFacultyEfalema;
    }

    public void setIDFacultyEfalema(String IDFacultyEfalema) {
        this.IDFacultyEfalema = IDFacultyEfalema;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

    public String getValue() {
        return Value;
    }

    public void setValue(String Value) {
        this.Value = Value;
    }

    public String getCritism() {
        return Critism;
    }

    public void setCritism(String Critism) {
        this.Critism = Critism;
    }

    public String getSuggestion() {
        return Suggestion;
    }

    public void setSuggestion(String Suggestion) {
        this.Suggestion = Suggestion;
    }
    
    public void setAdminUsername(String AdminUsername){
        this.AdminUsername = AdminUsername;
    }
    public String getAdminUsername(){
        return this.AdminUsername;
    }
    public void setAdminPassword(String AdminPassword){
        this.AdminPassword = AdminPassword;
    }
    public String getAdminPassword(){
        return this.AdminPassword;
    }
    public void setCategory(String Category){
        this.Category = Category;
    }
    public String getCategory(){
        return this.Category;
    }
    public void setDescriptions(String Descriptions){
        this.Descriptions = Descriptions;
    }
    public String getDescriptions(){
        return this.Descriptions;
    }
    public void setCategoryID(String CategoryID){
        this.CategoryID = CategoryID;
    }
    public String getCategoryID(){
        return this.CategoryID;
    }
    public void setEDecriptions(String EDescriptions){
        this.EDescriptions = EDescriptions;
    }
    public String getEDescriptions(){
        return this.EDescriptions;
    }
    public void setPostID(String PostID){
        this.PostID = PostID;
    }
    public String getPostID(){
        return this.PostID;
    }
    public void setTexts(String Texts){
        this.Texts = Texts;
    }
    public String getTexts(){
        return this.Texts;
    }
    public void setTitle(String Title){
        this.Title = Title;
    }
    public String getTitle(){
        return this.Title;
    }
    public void setAdminID(String AdminID){
        this.AdminID = AdminID;
    }
    public String getAdminID(){
        return this.AdminID;
    }
    public void setPhoto(String Photo){
        this.Photo = Photo;
    }
    public String getPhoto(){
        return this.Photo;
    }
    public void setNIM(String NIM){
        this.NIM = NIM;
    }
    public String getNIM(){
        return this.NIM;
    }
    public void setName(String Name){
        this.Name = Name;
    }
    public String getName(){
        return this.Name;
    }
    public void setPhoneNumber(String PhoneNumber){
        this.PhoneNumber = PhoneNumber;
    }
    public String getPhoneNumber(){
        return this.PhoneNumber;
    }
    public void setSemester(String Semester){
        this.Semester = Semester;
    }
    public String getSemester(){
        return this.Semester;
    }
    public void setDate_of_Birth(String Date_of_Birth){
        this.Date_of_Birth = Date_of_Birth;
    }
    public String getDate_of_Birth(){
        return this.Date_of_Birth;
    }
    public void setGender(String Gender){
        this.Gender = Gender;
    }
    public String getGender(){
        return this.Gender;
    }
    public void setAddress(String Address){
        this.Address = Address;
    }
    public String getAddress(){
        return this.Address;
    }
    public void setAcademic_Year(String Academic_Year){
        this.Academic_Year = Academic_Year;
    }
    public String getAcademic_Year(){
        return this.Academic_Year;
    }
    public void setUserID(String UserID){
        this.UserID = UserID;
    }
    public String getUserID(String UserID){
        return this.UserID;
    }
    public void setUserPassword(String UserPassword){
        this.UserPassword = UserPassword;
    }
    public String getUserPassword(){
        return this.UserPassword;
    }
    
    public int doLogin()
    {
        int i = 0;
        try
        {
            ResultSet rs;
            Connection con = Koneksi.Open();
            String sql = "SELECT COUNT(*) FROM Accounts.admins WHERE Username=? AND Passwords=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, AdminUsername.trim());
            pr.setString(2, AdminPassword.trim());
            
            rs = pr.executeQuery();
            if(rs.next())
            {
                i = rs.getInt(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return i;
    }
    
    public int doInsertCategory() {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "EXEC spInsertCategory ?, ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, Category.trim());
            pr.setString(2, Descriptions.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
    public int doDeleteCategory() 
    {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "delete from Categories.Category where CategoryID = ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, CategoryID.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
        public int doInsertDescriptions() {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "EXEC spInsertDescription ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, EDescriptions.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
        
        public int doDeleteArticles() 
    {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "delete from Categories.Post where PostID = ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, PostID.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
        
        public ArrayList getCategoryIDCombo()
    {
        try
        {
            ResultSet rs;
            Database kon = new Database();
            Connection con = kon.Open();
            Statement stmt = con.createStatement();
            String str = "select CategoryID, Category From Categories.Category  ";
            
            rs = stmt.executeQuery(str);
            ArrayList data_client = new ArrayList();
            
            while (rs.next()) {
                this.setCategoryID(rs.getString(1));
                this.setCategory(rs.getString(2));
                data_client.add(this.getCategoryID());
                data_client.add(this.getCategory());
            }

            return data_client;
        }
        catch(Exception e)
        {
            JOptionPane.showMessageDialog(null, e.getMessage());
            return null;
        }
    }

        public int doInsertArticles() 
    {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "EXEC spInsertPost ?, ?, ?, ?, ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, CategoryID.trim());
            pr.setString(2, Texts.trim());
            pr.setString(3, Title.trim());
            pr.setString(4, AdminID.trim());
            pr.setString(5, Photo.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
    
        public int doInsertStudent() {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "EXEC spInsertStudents ?,?,?,?,?,?,?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, Name.trim());
            pr.setString(2, PhoneNumber.trim());
            pr.setString(3, Semester.trim());
            pr.setString(4, Date_of_Birth.trim());
            pr.setString(5, Gender.trim());
            pr.setString(6, Address.trim());
            pr.setString(7, Academic_Year.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
        
        public int doRegister() 
    {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "EXEC spInsertUsers ?, ?, ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, NIM.trim());
            pr.setString(2, UserPassword.trim());
            pr.setString(3, Photo.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return i;
    }
        
     public int doLoginStudent()
    {
        int i = 0;
        try
        {
            ResultSet rs;
            Connection con = Koneksi.Open();
            String sql = "SELECT COUNT(*) FROM Accounts.Users WHERE NIM=? AND Password=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, NIM.trim());
            pr.setString(2, UserPassword.trim());
            
            rs = pr.executeQuery();
            if(rs.next())
            {
                i = rs.getInt(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return i;
    }   
     
     public int addEFALEMAStudent() 
    {
        int i = 0;
        try
        {
            Connection con = Koneksi.Open();
            
            String sql = "spInsertEFALEMA ?, ?, ?, ?, ?, ?";
            PreparedStatement pr = con.prepareStatement(sql);
            
            pr.setString(1, NIM.trim());
            pr.setString(2, IDFacultyEfalema.trim());
            pr.setString(3, Question.trim());
            pr.setString(4, Value.trim());
            pr.setString(5, Critism.trim());
            pr.setString(6, Suggestion.trim());
            i = pr.executeUpdate();
        }
        catch(Exception ex){
            System.out.println(ex.getCause());
        }
        return i;
    }
}

