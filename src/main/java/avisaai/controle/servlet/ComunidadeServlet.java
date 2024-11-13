package avisaai.controle.servlet;

import avisaai.modelo.dao.comunidade.ComunidadeDAO;
import avisaai.modelo.dao.comunidade.ComunidadeDAOImpl;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.util.Utilitario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/comunidades", "/cadastro-comunidade", "/perfil-comunidade", "/atualizar-comunidade",
        "/acompanhar-comunidade", "/inserir-comunidade", "/editar-comunidade", "/excluir-comunidade", "/comunidade-nao-encontrada"})

public class ComunidadeServlet extends HttpServlet {

    private static final long serialVersionUID = 9041251404722080496L;

    private ComunidadeDAO comunidadeDAO;

    public void init() {
        comunidadeDAO = new ComunidadeDAOImpl();
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

                case "/comunidades":
                    mostrarTelaConsultaComunidade(requisicao, resposta);
                    break;

                case "/cadastro-comunidade":
                    mostrarTelaCadastroComunidade(requisicao, resposta);
                    break;

                case "/perfil-comunidade":
                    mostrarTelaPerfilComunidade(requisicao, resposta);
                    break;

                case "/atualizar-comunidade":
                    atualizarComunidade(requisicao, resposta);
                    break;

                case "/acompanhar-comunidade":
                    acompanharDesacompanharComunidade(requisicao, resposta);
                    break;

                case "/inserir-comunidade":
                    inserirComunidade(requisicao, resposta);
                    break;

                case "/editar-comunidade":
                    mostrarTelaAtualizaComunidade(requisicao, resposta);
                    break;

                case "/excluir-comunidade":
                    excluirComunidade(requisicao, resposta);
                    break;

                case "/comunidade-nao-encontrado":
                    erro(requisicao, resposta);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void mostrarTelaCadastroComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();
        requisicao.getRequestDispatcher("/recursos/paginas/comunidade/cadastro-comunidade.jsp").forward(requisicao,
                resposta);
    }

    private void mostrarTelaPerfilComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();
        requisicao.getRequestDispatcher("/recursos/paginas/comunidade/perfil-comunidade.jsp").forward(requisicao,
                resposta);
    }

    private void inserirComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        String nome = requisicao.getParameter("nome");
        String descricao = requisicao.getParameter("descricao");
//		Foto fotoPerfil = requisicao.getParameter("foto");
//		String fotoExtencao = requisicao.getParameter("foto-extencao");

//		Foto foto = new Foto(fotoPerfil.getBytes(), fotoExtencao);

        Comunidade comunidade = new Comunidade(nome, descricao, null);
        comunidadeDAO.inserirComunidade(comunidade);

        resposta.sendRedirect("perfil-comunidade");
    }

    private void excluirComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));

        Comunidade comunidade = comunidadeDAO.consultarComunidadeId(idComunidade);

        if (comunidade == null) {
            requisicao.getRequestDispatcher("comunidade-nao-encontrada").forward(requisicao, resposta);
            return;
        }

        comunidadeDAO.deletarComunidade(comunidade);

        resposta.sendRedirect("comunidades");
    }

    private void atualizarComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));
        String nome = requisicao.getParameter("nome");
        String descricao = requisicao.getParameter("descricao");
//		String fotoPerfil = requisicao.getParameter("foto");
//		String fotoExtencao = requisicao.getParameter("foto_extencao");
//
//		Foto foto = new Foto(fotoPerfil.getBytes(), fotoExtencao);

        Comunidade comunidade = comunidadeDAO.consultarComunidadeId(idComunidade);

        if (comunidade == null) {
            requisicao.getRequestDispatcher("comunidade-nao-encontrada").forward(requisicao, resposta);
            return;
        }

        comunidade.setDescricao(descricao);
//		comunidade.setFotoPerfil(foto);
        comunidade.setNome(nome);

        comunidadeDAO.atualizarComunidade(comunidade);

        resposta.sendRedirect("comunidades");

    }

    private void acompanharDesacompanharComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();

        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario-logado");

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));

        if(!usuarioLogado.getComunidadesAcompanhadas().contains(idComunidade)) {
            usuarioLogado.sairDaComunidade(comunidadeDAO.consultarComunidadeId(idComunidade));
            requisicao.setAttribute("mensagemPopup", "Deixou de acompanhar!");
        } else {
            usuarioLogado.entrarNaComunidade(comunidadeDAO.consultarComunidadeId(idComunidade));
            requisicao.setAttribute("mensagemPopup", "Acompanhando comunidade!");
        }

    }

    private void mostrarTelaAtualizaComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();
        requisicao.getRequestDispatcher("/recursos/paginas/comunidade/cadastro-comunidade.jsp").forward(requisicao,
                resposta);
    }

    private void mostrarTelaConsultaComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        String nome = requisicao.getParameter("nome");

        if (nome != null) {
            List<Comunidade> listaComunidades = comunidadeDAO.consultarComunidadePorNome(nome);

            if (listaComunidades != null && !listaComunidades.isEmpty()) {
                requisicao.setAttribute("listaComunidades", listaComunidades);
            }
        }

        requisicao.getRequestDispatcher("/recursos/paginas/comunidade/consulta-comunidade.jsp").forward(requisicao,
                resposta);
    }

    private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        HttpSession sessao = requisicao.getSession();
        requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
    }
}