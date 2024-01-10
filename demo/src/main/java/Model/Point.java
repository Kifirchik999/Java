package Model;

public class Point {
    private double x;
    private double y;
    private float r;
    
    private boolean result;

    public Point(double x, double y, float r){
        this.x = x;
        this.y = y;
        this.r = r;
        setResult(x, y, r);
    }

    public void setResult(double x,double y, float r) {
        if (x >=0 && x <= r/2) {
            if (y >=0 && y <= r/2) {
                this.result = true;
            }
        } else if (x >=0 && x <= r && y < 0 && y <= r) {
            float rad = r * (-1);
            if (y >= rad) {
                this.result = true;
            }
        } else if (x <= 0 && y >= 0) {
            float rad = r * (-1);
            if (x >= rad/2 && y <= r/2){
                this.result = true;
            }
        } else {
            this.result = false;
        }
    }
    
    public boolean getResult(){
        return this.result;
    }
    

    public void setR(int r) {
        this.r = r;
    }

    public float getR() {
        return r;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getX() {
        return x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getY() {
        return y;
    }

    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                '}';
    }
}
