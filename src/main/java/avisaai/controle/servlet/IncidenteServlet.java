package avisaai.controle.servlet;

import avisaai.modelo.dao.comentario.ComentarioDAO;
import avisaai.modelo.dao.comentario.ComentarioDAOImpl;
import avisaai.modelo.dao.comunidade.ComunidadeDAO;
import avisaai.modelo.dao.comunidade.ComunidadeDAOImpl;
import avisaai.modelo.dao.incidente.IncidenteDAO;
import avisaai.modelo.dao.incidente.IncidenteDAOImpl;
import avisaai.modelo.dao.localidade.LocalidadeDAO;
import avisaai.modelo.dao.localidade.LocalidadeDAOImpl;
import avisaai.modelo.dao.usuario.UsuarioDAO;
import avisaai.modelo.dao.usuario.UsuarioDAOImpl;
import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.enumeracao.categoria.Categoria;
import avisaai.modelo.enumeracao.situacao.Situacao;
import avisaai.util.Utilitario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/incidentes", "/perfil-incidente", "/consulta-incidente", "/inserir-incidente", "/cadastro-incidente", "/feed-pessoal", "/incidente-nao-encontrado"})
@MultipartConfig
public class IncidenteServlet extends HttpServlet {

    private static final long serialVersionUID = -2732576384429342823L;
    private IncidenteDAO incidenteDAO;
    private ComunidadeDAO comunidadeDAO;
    private LocalidadeDAO localidadeDAO;
    private UsuarioDAO usuarioDAO;
    private ComentarioDAO comentarioDAO;

    public void init() {
        incidenteDAO = new IncidenteDAOImpl();
        comunidadeDAO = new ComunidadeDAOImpl();
        localidadeDAO = new LocalidadeDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
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

                case "/perfil-incidente":
                    mostrarTelaPerfilIncidente(requisicao, resposta);
                    break;

                case "/incidentes":
                    mostrarTelaConsultaIncidente(requisicao, resposta);
                    break;

                case "/cadastro-incidente":
                    mostrarTelaCadastroIncidente(requisicao, resposta);
                    break;

                case "/inserir-incidente":
                    inserirIncidente(requisicao, resposta);
                    break;

                case "/atualizar-incidente":
                    atualizarIncidente(requisicao, resposta);
                    break;

                case "/excluir-incidente":
                    excluirIncidente(requisicao, resposta);
                    break;

                case "/feed-pessoal":
                    mostrarTelaFeedPessoal(requisicao, resposta);
                    break;

                case "/incidente-nao-encontrado":
                    erro(requisicao, resposta);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void mostrarTelaPerfilIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        Long idIncidente = Long.parseLong(requisicao.getParameter("id-ioncidente"));

        Incidente incidente = incidenteDAO.consultarIncidenteId(idIncidente);

        if (incidente != null) {
            List<Comentario> comentariosIncidente = comentarioDAO.consultarComentarioIncidente(incidente);
            requisicao.setAttribute("listaComentarios", comentariosIncidente);
            requisicao.setAttribute("incidente", incidente);
            requisicao.getRequestDispatcher("/recursos/paginas/incidente/perfil-incidente.jsp").forward(requisicao, resposta);
        } else {
            resposta.sendRedirect("incidente-nao-encontrado");
        }
    }

    private void mostrarTelaConsultaIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        requisicao.getRequestDispatcher("/recursos/paginas/incidente/consulta-incidente.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaFeedPessoal(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        List<Incidente> incidentes = (List<Incidente>) requisicao.getAttribute("listaIncidentes");

        if (incidentes == null) {
            incidentes = new ArrayList<>();
            List<Comunidade> comunidades = comunidadeDAO.recuperarComunidades();

            for (Comunidade comunidade : comunidades) {
                List<Incidente> incidentesComunidade = incidenteDAO.consultarIncidentesComunidade(comunidade);
                if (incidentesComunidade != null) {
                    incidentes.addAll(incidentesComunidade);
                }
            }

            requisicao.setAttribute("listaIncidentes", incidentes);
        }

        requisicao.getRequestDispatcher("/recursos/paginas/incidente/feed-pessoal.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaCadastroIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        String listaLocalidades = requisicao.getParameter("listaLocalidades");

        if (listaLocalidades == null) {
            List<Localidade> localidades = localidadeDAO.recuperarLocalidades();
            List<Comunidade> comunidades = comunidadeDAO.recuperarComunidades();
            requisicao.setAttribute("listaLocalidades", localidades);
            requisicao.setAttribute("listaComunidades", comunidades);
        }

        requisicao.getRequestDispatcher("/recursos/paginas/incidente/cadastro-incidente.jsp").forward(requisicao, resposta);
    }

    private void inserirIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Usuario usuario = (Usuario) sessao.getAttribute("usuarioLogado");
        String titulo = requisicao.getParameter("titulo");
        String descricao = requisicao.getParameter("descricao");
        LocalDateTime dataHora = LocalDateTime.now();
        Categoria categoria = Categoria.valueOf(requisicao.getParameter("categoria"));
        Situacao situacao = Situacao.ATIVO;

        Incidente incidente = new Incidente(titulo, descricao, dataHora, categoria,
                comunidadeDAO.consultarComunidadeId(Long.parseLong(requisicao.getParameter("id-localidade"))),
                usuario, localidadeDAO.consultarLocalidadeId(Long.parseLong(requisicao.getParameter("id-comunidade"))),
                situacao);

        incidenteDAO.inserirIncidente(incidente);

        Long idIncidente = incidente.getId();

        requisicao.setAttribute("id-incidente", idIncidente);
        requisicao.setAttribute("mensagemPopup", "Incidente Cadastrado!");
        requisicao.getRequestDispatcher("perfil-incidente").forward(requisicao, resposta);
    }

    private void atualizarIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idIncidente = Long.parseLong(requisicao.getParameter("id-incidente"));

        String titulo = requisicao.getParameter("titulo");
        String descricao = requisicao.getParameter("descricao");
        LocalDateTime dataHora = LocalDateTime.parse(requisicao.getParameter("data-hora"));
        Categoria categoria = Categoria.valueOf(requisicao.getParameter("categoria"));
        Situacao situacao = Situacao.valueOf(requisicao.getParameter("situacao"));

        Long idComunidade = Long.parseLong(requisicao.getParameter("id-comunidade"));

        Long idLocalidade = Long.parseLong(requisicao.getParameter("id-localidade"));

        Long idUsuario = Long.parseLong(requisicao.getParameter("id-usuario"));

        if (incidenteDAO.consultarIncidenteId(idUsuario) != null) {
            resposta.sendRedirect("incidentes");
        }

        incidenteDAO.atualizarIncidente(new Incidente(idIncidente, titulo, descricao, dataHora, categoria,
                comunidadeDAO.consultarComunidadeId(idComunidade),
                usuarioDAO.consultarUsuarioId(idUsuario), localidadeDAO.consultarLocalidadeId(idLocalidade), situacao));

        requisicao.setAttribute("mensagemPopup", "Incidente Atualizado!");
        requisicao.getRequestDispatcher("perfil-incidente").forward(requisicao, resposta);
    }

    private void excluirIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        Long idIncidente = Long.parseLong(requisicao.getParameter("id-incidente"));

        incidenteDAO.deletarIncidente(incidenteDAO.consultarIncidenteId(idIncidente));

        requisicao.setAttribute("mensagemPopup", "Incidente Excluído!");
        resposta.sendRedirect("feed-pessoal");
    }

    private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
    }
}