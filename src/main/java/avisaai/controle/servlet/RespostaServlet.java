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
import java.util.List;

@WebServlet(urlPatterns = { "/inserir-resposta", "/atualizar-resposta", "/excluir-resposta", "/listar-respostas",
		"/exibir-resposta", "/resposta-nao-encontrada" })
public class RespostaServlet extends HttpServlet {

	private static final long serialVersionUID = -6207710279638623681L;
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

			case "/listar-respostas":
				listarRespostas(requisicao, resposta);
				break;

			case "/exibir-resposta":
				exibirResposta(requisicao, resposta);
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

		String conteudo = requisicao.getParameter("conteudo");
		Long idComentario = Long.parseLong(requisicao.getParameter("id_comentario"));

		HttpSession sessao = requisicao.getSession();
		Usuario usuario = (Usuario) sessao.getAttribute("usuarioLogado");

		Comentario comentarioOrigem = comentarioDAO.consultarComentarioId(idComentario);

		Resposta novaResposta = new Resposta(conteudo, LocalDateTime.now(), usuario, comentarioOrigem);
		respostaDAO.inserirResposta(novaResposta);

		requisicao.setAttribute("mensagemPopup", "Resposta Cadastrada!");
		requisicao.getRequestDispatcher("/exibir-resposta").forward(requisicao, resposta);
	}

	private void atualizarResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idResposta = Long.parseLong(requisicao.getParameter("id_resposta"));
		String conteudo = requisicao.getParameter("conteudo");

		Resposta respostaObj = respostaDAO.consultarRespostaId(idResposta);
		respostaObj.setConteudo(conteudo);
		respostaObj.setDataHora(LocalDateTime.now());

		respostaDAO.atualizarResposta(respostaObj);

		requisicao.setAttribute("mensagemPopup", "Resposta Atualizada!");
		requisicao.getRequestDispatcher("/exibir-resposta").forward(requisicao, resposta);
	}

	private void excluirResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idResposta = Long.parseLong(requisicao.getParameter("id_resposta"));
		Resposta respostaObj = respostaDAO.consultarRespostaId(idResposta);
		respostaDAO.deletarResposta(respostaObj);

		requisicao.setAttribute("mensagemPopup", "Resposta Excluída!");
		requisicao.getRequestDispatcher("/listar-respostas").forward(requisicao, resposta);
	}

	private void listarRespostas(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idComentario = Long.parseLong(requisicao.getParameter("id_comentario"));
		Comentario comentario = comentarioDAO.consultarComentarioId(idComentario);

		List<Resposta> listaRespostas = respostaDAO.consultarRespostaComentarioOrigem(comentario);

		requisicao.setAttribute("listaRespostas", listaRespostas);
		requisicao.getRequestDispatcher("lista-respostas.jsp").forward(requisicao, resposta);
	}

	private void exibirResposta(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws SQLException, ServletException, IOException {

		Long idResposta = Long.parseLong(requisicao.getParameter("id_resposta"));
		Resposta respostaObj = respostaDAO.consultarRespostaId(idResposta);

		requisicao.setAttribute("resposta", respostaObj);
		requisicao.getRequestDispatcher("resposta.jsp").forward(requisicao, resposta);
	}

	private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("erro-404.jsp").forward(requisicao, resposta);
	}
}