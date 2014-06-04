/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lv.nutritionCalc.objects;

/**
 *
 * @author Madara
 */
public class Produkts {
    private String Nosaukums = "";
    private String Mervieniba = "";
    private String kCal = "";
    private String Tauki = "";
    private String OglHidr = "";
    private String OlBalt = "";
    private String Sals = "";
    private String TranSk = "";
    private String SkiedrViel = "";
    private String Cukurs = "";
    private String Id = "";
    
    public Produkts(String Nosaukums, String Mervieniba, String kCal){
        this.Nosaukums=Nosaukums;
        this.Mervieniba=Mervieniba;
        this.kCal=kCal;
        this.Tauki="0.0";
        this.OglHidr="0.0";
        this.OlBalt = "0.0";
        this.Sals = "0.0";
        this.TranSk = "0.0";
        this.SkiedrViel = "0.0";
        this.Cukurs = "0.0";
    }
    public Produkts(String Id, String Nosaukums, String Mervieniba, String kCal, 
            String Tauki, String OglHidr, String OlBalt, String Sals, String TranSk, 
            String SkiedrViel, String Cukurs){
        
        this.Id = Id;
        this.Nosaukums = Nosaukums;
        this.Mervieniba = Mervieniba;
        this.kCal = kCal;
        this.Tauki = Tauki;
        this.OglHidr = OglHidr;
        this.OlBalt = OlBalt;
        this.Sals = Sals;
        this.TranSk = TranSk;
        this.SkiedrViel = SkiedrViel;
        this.Cukurs = Cukurs;
    }
    
    public String getId(){
        return this.Id;
    }
    public String getNosaukums(){
        return this.Nosaukums;
    }
    public void setNosaukums(String Nosaukums){
        this.Nosaukums=Nosaukums;
    }
    public String getMervieniba(){
        return this.Mervieniba;
    }
    public void setMervieniba(String Mervieniba){
        this.Mervieniba=Mervieniba;
    }
    public String getkCal(){
        return this.kCal;
    }
    public void setkCal(String kCal){
        try{
            float number = Float.parseFloat(kCal);
            this.kCal=kCal;
        }
        catch(NumberFormatException e){
            this.kCal = "0.0";
        }  
    }
    public String getTauki(){
        return this.Tauki;
    }
    public void setTauki(String Tauki){
        try{
            float number = Float.parseFloat(Tauki);
            this.Tauki=Tauki;
        }
        catch(NumberFormatException e){
            this.Tauki = "0.0";
        }  
    }
    public String getOglHidr(){
        return this.OglHidr;
    }
    public void setOglHidr(String OglHidr){
        try{
            float number = Float.parseFloat(OglHidr);
            this.OglHidr=OglHidr;
        }
        catch(NumberFormatException e){
            this.OglHidr = "0.0";
        } 
    }
    public String getOlBalt(){
        return this.OlBalt;
    }
    public void setOlBalt(String OlBalt){
        try{
            float number = Float.parseFloat(OlBalt);
            this.OlBalt=OlBalt;
        }
        catch(NumberFormatException e){
            this.OlBalt = "0.0";
        } 
    }
    public String getSals(){
        return this.Sals;
    }
    public void setSals(String Sals){
        try{
            float number = Float.parseFloat(Sals);
            this.Sals=Sals;
        }
        catch(NumberFormatException e){
            this.Sals = "0.0";
        }
    }
    public String getTranSk(){
        return this.TranSk;
    }
    public void setTranSk(String TranSk){
        try{
            float number = Float.parseFloat(TranSk);
            this.TranSk=TranSk;
        }
        catch(NumberFormatException e){
            this.TranSk = "0.0";
        }
    }
    public String getSkiedrViel(){
        return this.SkiedrViel;
    }
    public void setSkiedrViel(String SkiedrViel){
        try{
            float number = Float.parseFloat(SkiedrViel);
            this.SkiedrViel=SkiedrViel;
        }
        catch(NumberFormatException e){
            this.SkiedrViel = "0.0";
        } 
    }
    public String getCukurs(){
        return this.Cukurs;
    }
    public void setCukurs (String Cukurs){
        try{
            float number = Float.parseFloat(Cukurs);
            this.Cukurs=Cukurs;
        }
        catch(NumberFormatException e){
            this.Cukurs = "0.0";
        }   
    }
}
