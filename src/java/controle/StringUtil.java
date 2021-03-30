/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

/**
 *
 * @author Pichau
 */
public class StringUtil {
    
    public static boolean isEmpty (String s){
        if (s == null){
            return true;
        }
        s = s.trim();
        return s.length() == 0;
    }
    
    
    public static String reverse (String s){
        if (s == null){
            return s;
        }
        StringBuilder sb = new StringBuilder(s);
        sb.reverse();
        return sb.toString();
    }
        
    public static boolean containsForbiddenWord(String s) {
        return s.contains("gay");
    }
    
     public static boolean containsNumber(String s) {
        return s.contains("1");
    }
   
}
