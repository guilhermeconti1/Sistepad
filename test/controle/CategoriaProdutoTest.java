/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.BeforeClass;
import negocio.CategoriaProduto;

/**
 *
 * @author Pichau
 */
public class CategoriaProdutoTest {

    private CategoriaProduto catProd;
    

    ;
    
    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        catProd = new CategoriaProduto();

        catProd.setDescricaocat("olá mundo");
    }

    @Test
    public void testIsEmpty() {
        boolean b;

        b = StringUtil.isEmpty(catProd.getDescricaocat());
        Assert.assertFalse(b);

        b = StringUtil.isEmpty(null);
        Assert.assertTrue(b);

        b = StringUtil.isEmpty("");
        Assert.assertTrue(b);
    }

    @Test
    public void testContainsForbiddenWord() {
        
        boolean b;

        b = StringUtil.containsForbiddenWord(catProd.getDescricaocat());
        Assert.assertFalse("O Texto contém uma ou mais palavras probídas", b);
        System.out.println("Passou no teste da função 'containsForbiddenWord'");

                
    }

    @Test
    public void testContainsNumber() {

        boolean b;

        b = StringUtil.containsForbiddenWord(catProd.getDescricaocat());
        Assert.assertFalse("O Texto contém uma ou mais numeros", b);
        System.out.println("Passou no teste da função 'ContainsNumber'");

        
    }
    
    @Test
    public void minhaFuncao() {
        boolean nome = "Maria".matches(".*\\d+.*");
        System.out.println("Retorno = " + nome);
        
    }
}
