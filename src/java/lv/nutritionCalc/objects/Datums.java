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
public class Datums {
    private int gads;
    private int menesis;
    private int diena;
    private String date;
    public Datums(){
        gads=0;
        menesis=0;
        diena=0;
        date="NULL";
    }
    public Datums(int g, int m, int d){
        this.gads=g;
        this.menesis=m;
        this.diena=d;
        String men="";
        String diena="";
        if(m<=9) men="0"+m;
        else men=""+m;
        if(d<=9) diena="0"+d;
        else diena=""+d;
        date=g+"-"+men+"-"+diena;
    }
    
    public int getGads() {
        return gads;
    }

    public void setGads(int gads) {
        this.gads = gads;
    }

    public int getMenesis() {
        return menesis;
    }

    public void setMenesis(int menesis) {
        this.menesis = menesis;
    }

    public int getDiena() {
        return diena;
    }

    public void setDiena(int diena) {
        this.diena = diena;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
