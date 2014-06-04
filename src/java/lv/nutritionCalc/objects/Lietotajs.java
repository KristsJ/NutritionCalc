/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lv.nutritionCalc.objects;

import java.util.Calendar;

/**
 *
 * @author Katrina
 */
public class Lietotajs {
    private String id;
    private String username;
    private String password;
    private String name;
    private String surname;
    private String gender;
    private String dateOfBirth;
    private String height;
    private String weight;
    
    public Lietotajs(String uname, String pass, String name){
        this.username=uname;
        this.password=pass;
        this.name=name;
        this.surname="";
        Calendar c = Calendar.getInstance();
        String m="",d="";
        if((c.get(Calendar.MONTH)+1)<=9)
            m="0"+(c.get(Calendar.MONTH)+1);
        else m=""+c.get(Calendar.MONTH)+1;
        if(c.get(Calendar.DAY_OF_MONTH)<=9)
            d="0"+c.get(Calendar.DAY_OF_MONTH);
        else d=""+c.get(Calendar.DAY_OF_MONTH);
        this.dateOfBirth=c.get(Calendar.YEAR)+"-"+m+"-"+d;
        this.gender="N";
        this.height="0";
        this.weight="0";     
    }
    
    public Lietotajs(String id, String uname, String pass, String name, String surname, String dateOfBirth, String gender, String height, String weight){
        this.id=id;
        this.username=uname;
        this.password=pass;
        this.name=name;
        this.surname=surname;
        this.dateOfBirth=dateOfBirth;
        this.gender=gender;
        this.height=height;
        this.weight=weight;     
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        
        this.dateOfBirth = dateOfBirth;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }
    public String getId(){
        return this.id;
    }
    
    public String getBMI(){
        double heightMeters = (Double.parseDouble(height))/100;
        double bmi = Double.parseDouble(this.weight)/(Math.pow(heightMeters, 2));
        long bmi2 = Math.round(bmi);
        return ""+bmi2;
    }
    
    public String getAge(){
        String[]fullDate=this.dateOfBirth.split("-");
        String birthDay = fullDate[2];
        String birthMonth = fullDate[1];
        String birthYear = fullDate[0];
        int bd=0,bm=0, by=0;
        if(birthDay.startsWith("0")) bd=Integer.parseInt(""+birthDay.charAt(1));
        else bd = Integer.parseInt(birthDay);
        if(birthMonth.startsWith("0")) bm=Integer.parseInt(""+birthMonth.charAt(1));
        else bm = Integer.parseInt(birthMonth);
        by=Integer.parseInt(birthYear);
        Calendar birthDate = Calendar.getInstance();
        birthDate.set(by, bm-1, bd);
        Calendar curDate = Calendar.getInstance();
        long daysBetween = daysBetween(birthDate, curDate);
        int years =(int)(daysBetween-(daysBetween%365))/365;
        return ""+years;
    }
    
    public static long daysBetween(Calendar startDate, Calendar endDate) {  
        Calendar date = (Calendar) startDate.clone();  
        long daysBetween = 0;  
        while (date.before(endDate)) {  
            date.add(Calendar.DAY_OF_MONTH, 1);  
            daysBetween++;  
        }  
        return daysBetween;  
    }
}
