/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import static junit.framework.TestCase.assertEquals;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Pichau
 */
public class VendaTest {
    
    @Test
    public void testCalcularValorLiquido901() {
        double valorLiquidoEsperado = 900;

        Venda venda = new Venda();

        venda.setDatavenda("25/03/2020");
        venda.setValortotalvenda(1000);

        assertEquals(valorLiquidoEsperado, venda.calcularValorLiquido(10), 0.001);
    }

    @Test
    public void CalcularValorLiquido900() {
        double valorLiquidoEsperado = 900;

        Venda venda = new Venda();

        venda.setDatavenda("25/03/2020");
        venda.setValortotalvenda(1000);

        assertEquals(valorLiquidoEsperado, venda.calcularValorLiquido(10), 0.001);
    }

}
