package avisaai.controle.servlet;

import avisaai.modelo.dao.comentario.ComentarioDAO;
import avisaai.modelo.dao.comentario.ComentarioDAOImpl;
import avisaai.modelo.dao.incidente.IncidenteDAO;
import avisaai.modelo.dao.incidente.IncidenteDAOImpl;
import avisaai.modelo.dao.usuario.UsuarioDAO;
import avisaai.modelo.dao.usuario.UsuarioDAOImpl;
import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.util.Utilitario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(urlPatterns = { "/inserir-comentario", "/atualizar-comentario", "/excluir-comentario", "/comentarios",
		"/exibir-comentario", "/comentario-nao-encontrado" })
public class ComentarioServlet extends HttpServlet {

	private static final long serialVersionUID = 1653883628982882326L;
	private ComentarioDAO comentarioDAO;
	private IncidenteDAO incidenteDAO;
	private UsuarioDAO usuarioDAO;

	public void init() {
		comentarioDAO = new ComentarioDAOImpl();
		incidenteDAO = new IncidenteDAOImpl();
		usuarioDAO = new UsuarioDAOImpl();
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

			case "cadastro-comentario":
				mostrarCadastroComentario(requisicao, resposta);
				break;

			case "/inserir-comentario":
				inserirComentario(requisicao, resposta);
				break;

			case "/atualizar-comentario":
				atualizarComentario(requisicao, resposta);
				break;

			case "/excluir-comentario":
				excluirComentario(requisicao, resposta);
				break;

			case "/comentarios":
				listarComentarios(requisicao, resposta);
				break;

			case "/comentario-nao-encontrado":
				erro(requisicao, resposta);
				break;

			default:
				erro(requisicao, resposta);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void mostrarCadastroComentario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

		requisicao.getRequestDispatcher("cadastro-comentario.jsp").forward(requisicao, resposta);
	}

	private void inserirComentario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		String conteudo = requisicao.getParameter("conteudo");
		Incidente incidente = incidenteDAO
				.consultarIncidenteId(Long.parseLong(requisicao.getParameter("id_incidente")));
		Usuario usuario = usuarioDAO.consultarUsuarioId(Long.parseLong(requisicao.getParameter("id_usuario")));

		Comentario comentario = new Comentario(conteudo, LocalDateTime.now(), usuario, incidente);
		comentarioDAO.inserirComentario(comentario);

		requisicao.setAttribute("mensagemPopup", "Comentario Cadastrada!");
		requisicao.getRequestDispatcher("/comentarios").forward(requisicao, resposta);
	}

	private void atualizarComentario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idComentario = Long.parseLong(requisicao.getParameter("id_comentario"));
		String conteudo = requisicao.getParameter("conteudo");

		Comentario comentario = comentarioDAO.consultarComentarioId(idComentario);
		comentario.setConteudo(conteudo);
		comentario.setDataHora(LocalDateTime.now());

		comentarioDAO.atualizarComentario(comentario);

		requisicao.setAttribute("mensagemPopup", "Comunidade Atualizada!");
		requisicao.getRequestDispatcher("/comentarios").forward(requisicao, resposta);
	}

	private void excluirComentario(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idComentario = Long.parseLong(requisicao.getParameter("id_comentario"));
		Comentario comentario = comentarioDAO.consultarComentarioId(idComentario);
		comentarioDAO.deletarComentario(comentario);

		requisicao.setAttribute("mensagemPopup", "Comunidade Excluída!");
		requisicao.getRequestDispatcher("/comentarios").forward(requisicao, resposta);
	}

	private void listarComentarios(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idIncidente = Long.parseLong(requisicao.getParameter("id_incidente"));
		Incidente incidente = incidenteDAO.consultarIncidenteId(idIncidente);

		List<Comentario> listaComentarios = comentarioDAO.consultarComentarioIncidente(incidente);

		requisicao.setAttribute("listaComentarios", listaComentarios);
		requisicao.getRequestDispatcher("lista-comentarios.jsp").forward(requisicao, resposta);
	}

	private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("erro-404").forward(requisicao, resposta);
	}
}