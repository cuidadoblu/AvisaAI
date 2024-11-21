package avisaai.controle.servlet;

import avisaai.modelo.dao.contato.ContatoDAO;
import avisaai.modelo.dao.contato.ContatoDAOImpl;
import avisaai.modelo.dao.foto.FotoDAO;
import avisaai.modelo.dao.foto.FotoDAOImpl;
import avisaai.modelo.dao.incidente.IncidenteDAO;
import avisaai.modelo.dao.incidente.IncidenteDAOImpl;
import avisaai.modelo.dao.usuario.UsuarioDAO;
import avisaai.modelo.dao.usuario.UsuarioDAOImpl;
import avisaai.modelo.entidade.foto.Foto;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.contato.Contato;
import avisaai.util.Utilitario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/usuarios", "/login", "/fazer-login", "/deslogar", "/cadastro-usuario", "/alterar-senha", "/definir-senha",
        "/inserir-usuario", "/atualizar-usuario", "/atualizar-foto-usuario", "/excluir-usuario", "/perfil-usuario", "/perfil-usuario-logado", "/editar-usuario", "/usuario-nao-encontrado"})
@MultipartConfig
public class UsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1959126762240015341L;
    private UsuarioDAO usuarioDAO;
    private ContatoDAO contatoDAO;
    private FotoDAO fotoDAO;
    private IncidenteDAO incidenteDAO;

    public void init() {
        usuarioDAO = new UsuarioDAOImpl();
        contatoDAO = new ContatoDAOImpl();
        fotoDAO = new FotoDAOImpl();
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

                case "/usuarios":
                    mostrarTelaConsultaUsuario(requisicao, resposta);
                    break;

                case "/login":
                    mostrarTelaLogin(requisicao, resposta);
                    break;

                case "/fazer-login":
                    fazerLogin(requisicao, resposta);
                    break;

                case "/deslogar":
                    deslogar(requisicao, resposta);
                    break;

                case "/cadastro-usuario":
                    mostrarTelaCadastro(requisicao, resposta);
                    break;

                case "/alterar-senha":
                    mostrarTelaAlterarSenha(requisicao, resposta);
                    break;

                case "/definir-senha":
                    mostrarTelaDefinirSenha(requisicao, resposta);
                    break;

                case "/perfil-usuario":
                    mostrarTelaPerfilUsuario(requisicao, resposta);
                    break;

                case "/perfil-usuario-logado":
                    mostrarTelaPerfilUsuarioLogado(requisicao, resposta);
                    break;

                case "/editar-usuario":
                    mostrarTelaEditarUsuario(requisicao, resposta);
                    break;

                case "/inserir-usuario":
                    inserirUsuario(requisicao, resposta);
                    break;

                case "/atualizar-usuario":
                    atualizarUsuario(requisicao, resposta);
                    break;

                case "/atualizar-foto-usuario":
                    atualizarFotoUsuario(requisicao, resposta);
                    break;

                case "/excluir-usuario":
                    excluirUsuario(requisicao, resposta);
                    break;

                case "/usuario-nao-encontrado":
                    erro(requisicao, resposta);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void mostrarTelaLogin(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/login.jsp").forward(requisicao, resposta);
    }

    private void fazerLogin(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        String email = requisicao.getParameter("email");
        String senha = requisicao.getParameter("senha");

        if (!usuarioDAO.checarCredenciaisUsuario(email, senha)) {
            requisicao.setAttribute("mensagemErro", "Email ou senha incorretos.");
            RequestDispatcher dispatcher = requisicao.getRequestDispatcher("login");
            dispatcher.forward(requisicao, resposta);
        }

        Usuario usuarioLogado = usuarioDAO.recuperarUsuarioPorCredenciais(email, senha);

        if (usuarioLogado != null) {
            HttpSession sessao = requisicao.getSession();
            sessao.setAttribute("usuario-logado", usuarioLogado);
            RequestDispatcher dispatcher = requisicao.getRequestDispatcher("");
            dispatcher.forward(requisicao, resposta);
        }
    }

    private void deslogar(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        HttpSession sessao = requisicao.getSession();
        sessao.setAttribute("usuario-logado", null);

        resposta.sendRedirect("login");
    }

    private void mostrarTelaCadastro(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/cadastro-usuario.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaAlterarSenha(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/alterar-senha.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaDefinirSenha(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        HttpSession sessao = requisicao.getSession();
        requisicao.getRequestDispatcher("/recursos/paginas/usuario/definir-senha.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaConsultaUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        String nome = requisicao.getParameter("nome");

        if (nome != null) {
            List<Usuario> usuarios = usuarioDAO.consultarUsuarioNome(nome);
            if (usuarios.isEmpty()) {
                requisicao.getRequestDispatcher("/recursos/paginas/usuario/usuario-nao-encontrado.jsp").forward(requisicao, resposta);
                return;
            }
            requisicao.setAttribute("listaUsuarios", usuarios);
        }
        requisicao.getRequestDispatcher("/recursos/paginas/usuario/consultar-usuarios.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaPerfilUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();

        Usuario usuario = null;

        Long id = Long.parseLong(requisicao.getParameter("id-usuario"));

        usuario = usuarioDAO.consultarUsuarioId(id);

        Foto fotoUsuario = usuario.getFotoPerfil();

        List<Incidente> incidentesUsuario = incidenteDAO.consultarIncidentesUsuarioPorData(usuario);

        requisicao.setAttribute("listaIncidentes", incidentesUsuario);
        requisicao.setAttribute("usuario", usuario);
        requisicao.setAttribute("fotoPerfil", fotoUsuario);

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/perfil-usuario.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaPerfilUsuarioLogado(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        HttpSession sessao = requisicao.getSession();

        Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuario-logado");
        Foto fotoUsuario = usuarioLogado.getFotoPerfil();
        List<Incidente> incidentesUsuario = incidenteDAO.consultarIncidentesUsuarioPorData(usuarioLogado);

        requisicao.setAttribute("listaIncidentes", incidentesUsuario);
        requisicao.setAttribute("usuario", usuarioLogado);
        requisicao.setAttribute("fotoPerfil", fotoUsuario);

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/perfil-usuario-logado.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaEditarUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        requisicao.getRequestDispatcher("/recursos/paginas/usuario/editar-usuario.jsp").forward(requisicao, resposta);
    }

    private void inserirUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        String nome = requisicao.getParameter("nome");
        String sobrenome = requisicao.getParameter("sobrenome");
        String senha = requisicao.getParameter("senha");

        String telefone = requisicao.getParameter("telefone");
        String email = requisicao.getParameter("email");

        Contato contato = new Contato(telefone, email);
        contatoDAO.inserirContato(contato);

        // Adicionar papel aqui e trocar o null no construtor

        usuarioDAO.inserirUsuario(new Usuario(nome, sobrenome, senha, contato, null, null));

        requisicao.getRequestDispatcher("login").forward(requisicao, resposta);
    }

    private void atualizarUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Long idUsuario = Long.parseLong(requisicao.getParameter("id-usuario"));

        Usuario usuario = (Usuario) sessao.getAttribute("usuario-logado");

        Long idUsuarioLogado = usuario.getId();

        if (idUsuario != idUsuarioLogado) {
            requisicao.setAttribute("mensagemPopup", "Você pode alterar somente o seu usuário!");
            requisicao.getRequestDispatcher("perfil-usuario-logado").forward(requisicao, resposta);
        }

        if (usuarioDAO.consultarUsuarioId(idUsuario) == null) {
            resposta.sendRedirect("feed-pessoal");
        }

        String nome = requisicao.getParameter("nome");
        String sobrenome = requisicao.getParameter("sobrenome");
        String senha = requisicao.getParameter("senha");

        usuario.setNome(nome);
        usuario.setSobrenome(sobrenome);
        usuario.setSenha(senha);

        usuarioDAO.atualizarUsuario(usuario);

        requisicao.setAttribute("mensagemPopup", "Usuário Atualizado!");
        requisicao.getRequestDispatcher("perfil-usuario-logado").forward(requisicao, resposta);
    }

    private void atualizarFotoUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        HttpSession sessao = requisicao.getSession();

        Usuario usuario = (Usuario) sessao.getAttribute("usuario-logado");

        Foto fotoAntiga = usuario.getFotoPerfil();
        fotoDAO.deletarFoto(fotoAntiga);

        Part fotoPart = requisicao.getPart("foto");
        if (fotoPart == null || fotoPart.getSize() <= 0) {
            requisicao.setAttribute("mensagemErro", "Nenhuma foto enviada ou tamanho inválido.");
            requisicao.getRequestDispatcher("perfil-usuario-logado").forward(requisicao, resposta);
            return;
        }

        String fileName = fotoPart.getSubmittedFileName();
        String extensaoOriginal = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

        String mimeType = fotoPart.getContentType();

        if (!mimeType.startsWith("image/")) {
            requisicao.setAttribute("mensagemErro", "O arquivo enviado não é uma imagem válida.");
            requisicao.getRequestDispatcher("perfil-usuario-logado").forward(requisicao, resposta);
            return;
        }

        byte[] conteudoOriginal = fotoPart.getInputStream().readAllBytes();

        byte[] conteudoConvertido = Utilitario.converterImagemParaFormato(conteudoOriginal, "jpg");

        Foto foto = new Foto(conteudoConvertido, "jpg");
        fotoDAO.inserirFoto(foto);

        usuario.setFotoPerfil(foto);

        usuarioDAO.atualizarUsuario(usuario);

        requisicao.setAttribute("fotoPerfil", foto);

        requisicao.getRequestDispatcher("editar-usuario").forward(requisicao, resposta);
    }

    private void excluirUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws SQLException, ServletException, IOException {

        Long idUsuario = Long.parseLong(requisicao.getParameter("id-usuario"));
        usuarioDAO.deletarUsuario(usuarioDAO.consultarUsuarioId(idUsuario));

        Long idContato = Long.parseLong(requisicao.getParameter("id-contato"));
        contatoDAO.deletarContato(contatoDAO.consultarContatoId(idContato));

        requisicao.getRequestDispatcher("login").forward(requisicao, resposta);
    }

    private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
            throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
    }
}