package avisaai.controle.servlet;

import avisaai.modelo.dao.comunidade.ComunidadeDAO;
import avisaai.modelo.dao.comunidade.ComunidadeDAOImpl;
import avisaai.modelo.dao.foto.FotoDAO;
import avisaai.modelo.dao.foto.FotoDAOImpl;
import avisaai.modelo.dao.incidente.IncidenteDAO;
import avisaai.modelo.dao.incidente.IncidenteDAOImpl;
import avisaai.modelo.dao.usuario.UsuarioDAO;
import avisaai.modelo.dao.usuario.UsuarioDAOImpl;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.foto.Foto;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.util.Utilitario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/formulario-foto", "/salvar-foto", "/exibir-foto", "/exibir-foto-comunidade", "/exibir-foto-usuario", "/exibir-foto-incidente"})
@MultipartConfig
public class FotoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FotoDAO fotoDAO;
    private ComunidadeDAO comunidadeDAO;
    private UsuarioDAO usuarioDAO;
    private IncidenteDAO incidenteDAO;

    public void init() {
        fotoDAO = new FotoDAOImpl();
        comunidadeDAO = new ComunidadeDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
        incidenteDAO = new IncidenteDAOImpl();
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

                case "/formulario-foto":
                    mostrarFormFoto(requisicao, resposta);
                    break;

                case "/salvar-foto":
                    salvarFoto(requisicao, resposta);
                    break;

                case "/exibir-foto":
                    exibirFoto(requisicao, resposta);
                    break;

                case "/exibir-foto-comunidade":
                    exibirFotoPorComunidade(requisicao, resposta);
                    break;

                case "/exibir-foto-usuario":
                    exibirFotoPorUsuario(requisicao, resposta);
                    break;

                case "/exibir-foto-incidente":
                    exibirFotosDoIncidente(requisicao, resposta);
                    break;

                default:
                    resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Ação não reconhecida.");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void mostrarFormFoto(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {
        requisicao.getRequestDispatcher("/recursos/paginas/fotoTeste/foto.jsp").forward(requisicao, resposta);
    }

    private void salvarFoto(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {

        Part fotoPart = requisicao.getPart("foto");
        if (fotoPart == null || fotoPart.getSize() <= 0) {
            requisicao.setAttribute("mensagemErro", "Nenhuma foto enviada ou tamanho inválido.");
            requisicao.getRequestDispatcher("/recursos/paginas/fotoTeste/foto.jsp").forward(requisicao, resposta);
            return;
        }

        String fileName = fotoPart.getSubmittedFileName();
        String extensaoOriginal = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

        String mimeType = fotoPart.getContentType();

        if (!mimeType.startsWith("image/")) {
            requisicao.setAttribute("mensagemErro", "O arquivo enviado não é uma imagem válida.");
            requisicao.getRequestDispatcher("/recursos/paginas/fotoTeste/foto.jsp").forward(requisicao, resposta);
            return;
        }

        byte[] conteudoOriginal = fotoPart.getInputStream().readAllBytes();

        byte[] conteudoConvertido = Utilitario.converterImagemParaFormato(conteudoOriginal, "jpg");

        Foto foto = new Foto(conteudoConvertido, "jpg");
        fotoDAO.inserirFoto(foto);

        requisicao.setAttribute("id-foto", foto.getId());
        requisicao.getRequestDispatcher("/recursos/paginas/fotoTeste/exibirfoto.jsp").forward(requisicao, resposta);
    }

    private void exibirFoto(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {

        String idParam = requisicao.getParameter("id-foto");
        if (idParam == null || idParam.isEmpty()) {
            resposta.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID da foto é obrigatório.");
            return;
        }

        Long id = Long.parseLong(idParam);
        Foto foto = fotoDAO.consultarFotoId(id);

        if (foto == null) {
            resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Foto não encontrada.");
            return;
        }

        String mimeType = "image/" + foto.getExtensao();
        resposta.setContentType(mimeType);

        resposta.getOutputStream().write(foto.getConteudo());
        resposta.getOutputStream().flush();
    }

    private void exibirFotoPorComunidade(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {

        String idParam = requisicao.getParameter("id-comunidade");
        if (idParam == null || idParam.isEmpty()) {
            resposta.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID da comunidade é obrigatório.");
            return;
        }

        Long idComunidade = Long.parseLong(idParam);

        Comunidade comunidade = comunidadeDAO.consultarComunidadeId(idComunidade);
        if (comunidade == null) {
            resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Comunidade não encontrada.");
            return;
        }

        Foto foto = comunidade.getFotoPerfil();

        if (foto == null) {
            resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Nenhuma foto associada à comunidade.");
            return;
        }

        String mimeType = "image/" + foto.getExtensao();
        resposta.setContentType(mimeType);

        resposta.getOutputStream().write(foto.getConteudo());
        resposta.getOutputStream().flush();
    }

    private void exibirFotoPorUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {

        String idParam = requisicao.getParameter("id-usuario");
        if (idParam == null || idParam.isEmpty()) {
            resposta.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID da comunidade é obrigatório.");
            return;
        }

        Long idUsuario = Long.parseLong(idParam);

        Usuario usuario = usuarioDAO.consultarUsuarioId(idUsuario);
        if (usuario == null) {
            resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Usuário não encontrado.");
            return;
        }

        Foto foto = usuario.getFotoPerfil();

        if (foto == null) {
            resposta.sendError(HttpServletResponse.SC_NOT_FOUND, "Nenhuma foto associada ao Usuário.");
            return;
        }

        String mimeType = "image/" + foto.getExtensao();
        resposta.setContentType(mimeType);

        resposta.getOutputStream().write(foto.getConteudo());
        resposta.getOutputStream().flush();
    }

    public void exibirFotosDoIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException, SQLException {

        Long idIncidente = Long.parseLong(requisicao.getParameter("id-incidente"));

        Incidente incidente = incidenteDAO.consultarIncidenteId(idIncidente);

        List<Foto> fotos = fotoDAO.recuperarFotosIncidente(incidente);

        for (int i = 0; i < fotos.size(); i++) {
            resposta.getOutputStream().write(fotos.get(i).getConteudo());
        }


    }
}