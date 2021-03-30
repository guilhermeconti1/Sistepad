/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import static junit.framework.TestCase.assertEquals;

/**
 *
 * @author Pichau
 */
public class MathUtilTest {
    
    

    @Test
     public void testMdcAPar() {
        
       final int a = 6;
       final int b = 3;
       final int esperado = 3;
       final int obtido = MathUtil.mdc(a, b);
        assertEquals(esperado, obtido);
        
    }

     @Test
    public void testMdcAImpar(){
       final int a = 9;
       final int b = 3;
       final int esperado = 3;
       final int obtido = MathUtil.mdc(a, b);
        assertEquals(esperado, obtido);
    }
    
}
