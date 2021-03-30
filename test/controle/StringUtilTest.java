/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import org.junit.Assert;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Pichau
 */
public class StringUtilTest {
    
    @Test
    public void testIsEmpty(){
        boolean b;
        
        b = StringUtil.isEmpty("abc");
        Assert.assertFalse(b);
        
        b = StringUtil.isEmpty(null);
        Assert.assertTrue(b);
        
        b = StringUtil.isEmpty("");
        Assert.assertTrue(b);
    }
    
    @Test
    public void testReverse(){
       
        String r = StringUtil.reverse("abcd");
        Assert.assertEquals("dcba", r);
        
        r = StringUtil.reverse(null);
        Assert.assertNull(r);
              
    }
    
}
