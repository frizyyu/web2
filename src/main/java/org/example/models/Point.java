package org.example.models;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Point {
    private boolean isHit;
    private double x;
    private double y;
    private double r;
    private double time;
    private String workTime;

    public Point(double x, double y, double r, boolean isHit, long time) {
        setX(x);
        setY(y);
        setR(r);
        setIsHit(isHit);
        setTime(time);
        setWorkTime();
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setIsHit(boolean isHit) {
        this.isHit = isHit;
    }

    public void setTime(long time) {
        this.time = (double) (System.nanoTime() - time) / 10000000;
    }

    public void setWorkTime() {
        this.workTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));
    }

    public double getX() {
        return this.x;
    }

    public double getY() {
        return this.y;
    }

    public double getR() {
        return this.r;
    }

    public boolean getIsHit() {
        return this.isHit;
    }

    public double getTime() {
        return this.time;
    }

    public String getWorkTime() {
        return this.workTime;
    }
}