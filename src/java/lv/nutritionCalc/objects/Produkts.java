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
    public void setId(String Id){
        this.Id=Id;
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
        this.kCal=kCal;
    }
    public String getTauki(){
        return this.Tauki;
    }
    public void setTauki(String Tauki){
        this.Tauki=Tauki;
    }
    public String getOglHidr(){
        return this.OglHidr;
    }
    public void setOglHidr(String OglHidr){
        this.OglHidr=OglHidr;
    }
    public String getOlBalt(){
        return this.OlBalt;
    }
    public void setOlBalt(String OlBalt){
        this.OlBalt=OlBalt;
    }
    public String getSals(){
        return this.Sals;
    }
    public void setSals(String Sals){
        this.Sals=Sals;
    }
    public String getTranSk(){
        return this.TranSk;
    }
    public void setTranSk(String TranSk){
        this.TranSk=TranSk;
    }
    public String getSkiedrViel(){
        return this.SkiedrViel;
    }
    public void setSkiedrViel(String SkiedrViel){
        this.SkiedrViel=SkiedrViel;
    }
    public String getCukurs(){
        return this.Cukurs;
    }
    public void setCukurs (String Cukurs){
        this.Cukurs=Cukurs;
    }
}
