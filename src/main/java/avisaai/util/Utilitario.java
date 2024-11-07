package avisaai.util;

import avisaai.modelo.entidade.usuario.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Utilitario {

    public static void checarUsuarioLogadoMostrarTelas(HttpServletRequest requisicao, HttpServletResponse resposta)
        throws ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario-logado");

        if (usuarioLogado == null) {
            requisicao.getRequestDispatcher("login").forward(requisicao, resposta);
        }
    }
}
