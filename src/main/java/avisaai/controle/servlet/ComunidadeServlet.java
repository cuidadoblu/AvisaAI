package avisaai.controle.servlet;

import avisaai.modelo.dao.comunidade.ComunidadeDAO;
import avisaai.modelo.dao.comunidade.ComunidadeDAOImpl;
import avisaai.modelo.dao.foto.FotoDAO;
import avisaai.modelo.dao.foto.FotoDAOImpl;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.foto.Foto;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.util.Utilitario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/comunidades", "/cadastro-comunidade", "/perfil-comunidade", "/atualizar-comunidade",
        "/acompanhar-comunidade", "/inserir-comunidade", "/editar-comunidade", "/excluir-comunidade", "/comunidade-nao-encontrada"})
@MultipartConfig
public class ComunidadeServlet extends HttpServlet {

    private static final long serialVersionUID = 9041251404722080496L;

    private ComunidadeDAO comunidadeDAO;
    private FotoDAO fotoDAO;

    public void init() {
        comunidadeDAO = new ComunidadeDAOImpl();
        fotoDAO = new FotoDAOImpl();
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

        Comunidade comunidade = null;

        Long id = Long.parseLong(requisicao.getParameter("id-comunidade"));

        comunidade = comunidadeDAO.consultarComunidadeId(id);

        Foto fotoComunidade = comunidade.getFotoPerfil();

        sessao.setAttribute("comunidade", comunidade);
        sessao.setAttribute("fotoComunidade", fotoComunidade);

        requisicao.getRequestDispatcher("/recursos/paginas/comunidade/perfil-comunidade.jsp").forward(requisicao,
                resposta);
    }

    private void inserirComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Part fotoPart = requisicao.getPart("foto");
        if (fotoPart == null || fotoPart.getSize() <= 0) {
            requisicao.setAttribute("mensagemErro", "Nenhuma foto enviada ou tamanho inválido.");
            requisicao.getRequestDispatcher("cadastro-comunidade").forward(requisicao, resposta);
            return;
        }

        String fileName = fotoPart.getSubmittedFileName();
        String extensaoOriginal = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

        String mimeType = fotoPart.getContentType();

        if (!mimeType.startsWith("image/")) {
            requisicao.setAttribute("mensagemErro", "O arquivo enviado não é uma imagem válida.");
            requisicao.getRequestDispatcher("cadastro-comunidade").forward(requisicao, resposta);
            return;
        }

        byte[] conteudoOriginal = fotoPart.getInputStream().readAllBytes();

        byte[] conteudoConvertido = Utilitario.converterImagemParaFormato(conteudoOriginal, "jpg");

        Foto foto = new Foto(conteudoConvertido, "jpg");
        fotoDAO.inserirFoto(foto);

        String nome = requisicao.getParameter("nome");
        String descricao = requisicao.getParameter("descricao");

        Comunidade comunidade = new Comunidade(nome, descricao, foto);
        comunidadeDAO.inserirComunidade(comunidade);

        sessao.setAttribute("comunidade", comunidade);
        sessao.setAttribute("fotoComunidade", foto);

        requisicao.setAttribute("mensagemPopup", "Comunidade Cadastrada!");
        requisicao.getRequestDispatcher("comunidades").forward(requisicao, resposta);
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

        requisicao.setAttribute("mensagemPopup", "Comunidade Excluída!");
        resposta.sendRedirect("comunidades");
    }

    private void atualizarComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));
        String nome = requisicao.getParameter("nome");
        String descricao = requisicao.getParameter("descricao");

        Comunidade comunidade = comunidadeDAO.consultarComunidadeId(idComunidade);

        if (comunidade == null) {
            requisicao.getRequestDispatcher("comunidade-nao-encontrada").forward(requisicao, resposta);
            return;
        }

        Foto fotoAntiga = comunidade.getFotoPerfil();

        fotoDAO.deletarFoto(fotoAntiga);

        Part fotoPart = requisicao.getPart("foto");
        if (fotoPart == null || fotoPart.getSize() <= 0) {
            requisicao.setAttribute("mensagemErro", "Nenhuma foto enviada ou tamanho inválido.");
            requisicao.getRequestDispatcher("perfil-comunidade").forward(requisicao, resposta);
            return;
        }

        String fileName = fotoPart.getSubmittedFileName();
        String extensaoOriginal = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

        String mimeType = fotoPart.getContentType();

        if (!mimeType.startsWith("image/")) {
            requisicao.setAttribute("mensagemErro", "O arquivo enviado não é uma imagem válida.");
            requisicao.getRequestDispatcher("perfil-comunidade").forward(requisicao, resposta);
            return;
        }

        byte[] conteudoOriginal = fotoPart.getInputStream().readAllBytes();

        byte[] conteudoConvertido = Utilitario.converterImagemParaFormato(conteudoOriginal, "jpg");

        Foto foto = new Foto(conteudoConvertido, "jpg");

        comunidade.setDescricao(descricao);
		comunidade.setFotoPerfil(foto);
        comunidade.setNome(nome);

        comunidadeDAO.atualizarComunidade(comunidade);

        sessao.setAttribute("comunidade", comunidade);
        sessao.setAttribute("fotoComunidade", foto);

        requisicao.setAttribute("mensagemPopup", "Comunidade Atualizada!");
        resposta.sendRedirect("perfil-comunidade");

    }

    private void acompanharDesacompanharComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();

        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario-logado");

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));

        if(!usuarioLogado.getComunidadesAcompanhadas().contains(comunidadeDAO.consultarComunidadeId(idComunidade))) {
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