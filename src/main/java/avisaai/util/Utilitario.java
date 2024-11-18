package avisaai.util;

import avisaai.modelo.entidade.usuario.Usuario;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class Utilitario {

    public static void checarUsuarioLogadoMostrarTelas(HttpServletRequest requisicao, HttpServletResponse resposta)
        throws ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario-logado");

        if (usuarioLogado == null) {
            //requisicao.getRequestDispatcher("login").forward(requisicao, resposta);
        }
    }

    public static byte[] converterImagemParaFormato(byte[] imagemOriginal, String formato) throws IOException {
        ByteArrayInputStream inputStream = new ByteArrayInputStream(imagemOriginal);
        BufferedImage imagem = ImageIO.read(inputStream);

        if (imagem == null) {
            throw new IOException("A imagem enviada não é válida ou está corrompida.");
        }

        BufferedImage imagemConvertida = new BufferedImage(imagem.getWidth(), imagem.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = imagemConvertida.createGraphics();
        g2d.drawImage(imagem, 0, 0, null);
        g2d.dispose();

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(imagemConvertida, formato, outputStream);

        return outputStream.toByteArray();
    }
}
