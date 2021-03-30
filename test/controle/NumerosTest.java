/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Pichau
 */
public class NumerosTest {
    
    private Numeros n;
    
    public NumerosTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        n = new Numeros();
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of numeroPar method, of class Numeros.
     */
    @Test
    public void testNumeroPar() {
        
        assertEquals(true, n.numeroPar(8));
     
    }

    /**
     * Test of areaQuadrado method, of class Numeros.
     */
    @Test
    public void testAreaQuadrado() {
        assertEquals(100, n.areaQuadrado(10));
        
    }

    /**
     * Test of numeroDivisivel method, of class Numeros.
     */
    @Test
    public void testNumeroDivisivel() {
        assertTrue(n.numeroDivisivel(4, 2));
       
    }
    
}
