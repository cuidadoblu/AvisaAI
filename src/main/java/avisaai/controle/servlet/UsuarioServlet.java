package avisaai.controle.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import avisaai.modelo.dao.contato.ContatoDAO;
import avisaai.modelo.dao.contato.ContatoDAOImpl;
import avisaai.modelo.dao.usuario.UsuarioDAO;
import avisaai.modelo.dao.usuario.UsuarioDAOImpl;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.contato.Contato;

@WebServlet(urlPatterns = { "/login", "/cadastro-usuario", "/alterar-senha", "/definir-senha", "/inserir-usuario",
		"/atualizar-usuario", "/excluir-usuario", "/perfil-usuario", "/usuario-nao-encontrado" })
public class UsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1959126762240015341L;
	private UsuarioDAO usuarioDAO;
	private ContatoDAO contatoDAO;

	public void init() {
		usuarioDAO = new UsuarioDAOImpl();
		contatoDAO = new ContatoDAOImpl();
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

			case "/login":
				mostrarTelaLogin(requisicao, resposta);
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

			case "/inserir-usuario":
				inserirUsuario(requisicao, resposta);
				break;

			case "/atualizar-usuario":
				atualizarUsuario(requisicao, resposta);
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

		boolean checarExistencia = false;

		if (usuarioDAO.consultarUsuarioSenha() == true && contatoDAO.consultarContatoEmail() == true) {
			checarExistencia = true;
		}

		if (checarExistencia) {
			HttpSession sessao = requisicao.getSession();
			Usuario usuario = ContatoDAO.recuperarUsuarioPorContatoEmail(email);
			sessao.setAttribute("usuario-logado", usuario);
			RequestDispatcher dispatcher = requisicao.getRequestDispatcher("perfil-usuario");
			dispatcher.forward(requisicao, resposta);
		} else {
			requisicao.getRequestDispatcher("mostrarTelaLogin").forward(requisicao, resposta);
		}
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
		requisicao.getRequestDispatcher("/recursos/paginas/usuario/redefinir-senha.jsp").forward(requisicao, resposta);
	}

	private void mostrarTelaPerfilUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		HttpSession sessao = requisicao.getSession();
		requisicao.getRequestDispatcher("/recursos/paginas/usuario/perfil-usuario.jsp").forward(requisicao, resposta);
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

		usuarioDAO.inserirUsuario(new Usuario(nome, sobrenome, senha, contato, null, null));

		requisicao.getRequestDispatcher("login").forward(requisicao, resposta);
	}

	private void atualizarUsuario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idUsuario = Long.parseLong(requisicao.getParameter("id-usuario"));

		if (usuarioDAO.consultarUsuarioId(idUsuario) == null) {
			resposta.sendRedirect("perfil-usuario");
		}

		String nome = requisicao.getParameter("nome");
		String sobrenome = requisicao.getParameter("sobrenome");
		String senha = requisicao.getParameter("senha");

		Long idContato = Long.parseLong(requisicao.getParameter("id-contato"));

		if (contatoDAO.consultarContatoId(idContato) == null) {
			resposta.sendRedirect("perfil-usuario");
		}

		String telefone = requisicao.getParameter("telefone");
		String email = requisicao.getParameter("email");

		contatoDAO.atualizarContato(new Contato(idContato, email, telefone));

		// Adicionar papel aqui e trocar o null no construtor

		usuarioDAO.atualizarUsuario(
				new Usuario(idUsuario, nome, sobrenome, senha, contatoDAO.consultarContatoId(idContato), null, null));

		requisicao.getRequestDispatcher("perfil-usuario").forward(requisicao, resposta);
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