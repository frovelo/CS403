import java.util.ArrayList;


public class Lexeme {

    String strVal;
    int intVal;
    boolean boolVal;
    ArrayList<Lexeme> arrayVal;
    String varVal;

    String type;
    Lexeme left = null;
    Lexeme right = null;

    
    public Lexeme(String type) {
        this.type = type;
    }

    
    public Lexeme(String type, String varOrStringVal) {
        this.type = type;
        if (varOrStringVal.startsWith("\"")) this.strVal = varOrStringVal.replace("\"", "");
        else this.varVal = varOrStringVal;
    }

    
    public Lexeme(String type, int intVal) {
        this.type = type;
        this.intVal = intVal;
    }

    
    public Lexeme(String type, boolean boolVal) {
        this.type = type;
        this.boolVal = boolVal;
    }

    
    public Lexeme(String type, ArrayList<Lexeme> arrayVal) {
        this.type = type;
        this.arrayVal = arrayVal;
    }

    
    public Lexeme(String type, Lexeme left, Lexeme right) {
        this.type = type;
        this.left = left;
        this.right = right;
    }

    boolean isInt() {
        return this.type.equals("INTEGER");
    }
    boolean isString() {
        return this.type.equals("STRING");
    }

    @Override
    public String toString() {
        switch (this.type) {
            case "STRING":
                return this.strVal;
            case "INTEGER":
                return Integer.toString(this.intVal);
            case "BOOLEAN":
                if (this.boolVal) return "true";
                else return "false";
            case "ARRAY":
                return this.arrayVal.toString();
            case "VARIABLE":
                return this.varVal;
            default:
                return this.type.toUpperCase();
        }
    }


}

