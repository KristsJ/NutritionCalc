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
    
    public Produkts(String Nosaukums, String Mervieniba, String kCal){
        this.Nosaukums=Nosaukums;
        this.Mervieniba=Mervieniba;
        this.kCal=kCal;
        this.Tauki="NULL";
        this.OglHidr="NULL";
        this.OlBalt = "NULL";
        this.Sals = "NULL";
        this.TranSk = "NULL";
        this.SkiedrViel = "NULL";
        this.Cukurs = "NULL";
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
