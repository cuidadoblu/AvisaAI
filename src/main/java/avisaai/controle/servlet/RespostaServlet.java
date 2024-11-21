package avisaai.controle.servlet;

import avisaai.modelo.dao.comentario.ComentarioDAO;
import avisaai.modelo.dao.comentario.ComentarioDAOImpl;
import avisaai.modelo.dao.resposta.RespostaDAO;
import avisaai.modelo.dao.resposta.RespostaDAOImpl;
import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.comentario.resposta.Resposta;
import avisaai.modelo.entidade.usuario.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet(urlPatterns = {"/inserir-resposta", "/atualizar-resposta", "/excluir-resposta", "/resposta-nao-encontrada"})
public class RespostaServlet extends HttpServlet {

    private static final long serialVersionUID = 3788791198004259638L;
    private RespostaDAO respostaDAO;
    private ComentarioDAO comentarioDAO;

    public void init() {
        respostaDAO = new RespostaDAOImpl();
        comentarioDAO = new ComentarioDAOImpl();
    }

    protected void doPost(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {
        doGet(requisicao, resposta);
    }

    protected void doGet(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        String action = requisicao.getServletPath();

        try {
            switch (action) {

                case "/inserir-resposta":
                    inserirResposta(requisicao, resposta);
                    break;

                case "/atualizar-resposta":
                    atualizarResposta(requisicao, resposta);
                    break;

                case "/excluir-resposta":
                    excluirResposta(requisicao, resposta);
                    break;

                case "/resposta-nao-encontrada":
                    erro(requisicao, resposta);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void inserirResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Long idComentario = Long.parseLong(requisicao.getParameter("id-comentario"));
        String conteudo = requisicao.getParameter("conteudo");
        Usuario usuario = (Usuario) sessao.getAttribute("usuarioLogado");

        Comentario comentarioOrigem = comentarioDAO.consultarComentarioId(idComentario);

        Resposta respostaNova = new Resposta(conteudo, LocalDateTime.now(), usuario, comentarioOrigem);
        respostaDAO.inserirResposta(respostaNova);

        requisicao.setAttribute("mensagemPopup", "Resposta Cadastrada!");
        resposta.sendRedirect("perfil-incidente?id-incidente=" + comentarioOrigem.getIncidente().getId());
    }

    private void atualizarResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idResposta = Long.parseLong(requisicao.getParameter("id-resposta"));
        String conteudo = requisicao.getParameter("conteudo");

        Resposta respostaExistente = respostaDAO.consultarRespostaId(idResposta);
        respostaExistente.setConteudo(conteudo);
        respostaExistente.setDataHora(LocalDateTime.now());

        respostaDAO.atualizarResposta(respostaExistente);

        requisicao.setAttribute("mensagemPopup", "Resposta Atualizada!");
        requisicao.getRequestDispatcher("perfil-comentario?idComentario").forward(requisicao, resposta);
    }

    private void excluirResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idResposta = Long.parseLong(requisicao.getParameter("id-resposta"));
        Resposta respostaObj = respostaDAO.consultarRespostaId(idResposta);

        respostaDAO.deletarResposta(respostaObj);

        requisicao.setAttribute("mensagemPopup", "Resposta Excluída!");
        requisicao.getRequestDispatcher("perfil-comentario?idComentario").forward(requisicao, resposta);
    }

    private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {
        requisicao.getRequestDispatcher("erro-404.jsp").forward(requisicao, resposta);
    }
}