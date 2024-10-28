package org.example.hitChecker;

public class CheckHit {
    public boolean hit(double x, double y, double r) {
        return inRect(x, y, r) || inTriangle(x, y, r) || inCircle(x, y, r);
    }

    private boolean inRect(double x, double y, double r) {
        return x >= 0 && y <= 0 && x <= r/2 && y <= r;
    }

    private boolean inTriangle(double x, double y, double r) {
        return (x >= -r/2) && (y <= r/2) && (2*y - 2*x <= r) && x <= 0 && y >= 0;
    }

    private boolean inCircle(double x, double y, double r) {
        return (x * x + y * y) <= (r * r) / 4 && x >= 0 && y >= 0;
    }
}
