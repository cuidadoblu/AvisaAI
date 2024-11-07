package avisaai.controle.servlet;

import avisaai.modelo.dao.localidade.LocalidadeDAO;
import avisaai.modelo.dao.localidade.LocalidadeDAOImpl;
import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.util.Utilitario;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/localidades", "/cadastro-localidade", "/editar-localidade", "/inserir-localidade", "/consultar-localidade", "/atualizar-localidade", "/excluir-localidade", "/buscarEstados", "/buscarCidades", "/buscarBairros", "/buscarLogradouros", "/localidade-nao-encontrada"})

public class LocalidadeServlet extends HttpServlet {

    private static final long serialVersionUID = -827990208860075084L;

    private LocalidadeDAO localidadeDAO;

    public void init() {
        localidadeDAO = new LocalidadeDAOImpl();
    }

    protected void doPost(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {
        doGet(requisicao, resposta);
    }

    protected void doGet(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        String action = requisicao.getServletPath();

        try {

            switch (action) {

                case "/localidades":
                    mostrarTelaConsultaLocalidade(requisicao, resposta);
                    break;

                case "/cadastro-localidade":
                    mostrarTelaCadastroLocalidade(requisicao, resposta);
                    break;

                case "/editar-localidade":
                    mostrarTelaAtualizaLocalidade(requisicao, resposta);
                    break;

                case "/atualizar-localidade":
                    atualizarLocalidade(requisicao, resposta);
                    break;

                case "/inserir-localidade":
                    inserirLocalidade(requisicao, resposta);
                    break;

                case "/excluir-localidade":
                    excluirLocalidade(requisicao, resposta);
                    break;

                case "/buscarEstados":
                    buscarEstados(requisicao, resposta);
                    break;

                case "/buscarCidades":
                    buscarCidades(requisicao, resposta);
                    break;

                case "/buscarBairros":
                    buscarBairros(requisicao, resposta);
                    break;

                case "/buscarLogradouros":
                    buscarLogradouros(requisicao, resposta);
                    break;

                case "/localidade-nao-encontrada":
                    erro(requisicao, resposta);
                    break;
            }

        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void mostrarTelaCadastroLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        List<String> estados = localidadeDAO.recuperarEstados();

        requisicao.setAttribute("estados", estados);
        requisicao.getRequestDispatcher("/recursos/paginas/localidade/cadastro-localidade.jsp").forward(requisicao, resposta);
    }

    private void inserirLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        String logradouro = requisicao.getParameter("logradouro");
        String tipo = requisicao.getParameter("tipo");
        String numero = requisicao.getParameter("numero");
        String bairro = requisicao.getParameter("bairro");
        String cidade = requisicao.getParameter("cidade");
        String estado = requisicao.getParameter("estado");
        String complemento = requisicao.getParameter("complemento");

        Localidade localidade = new Localidade(logradouro, tipo, Short.parseShort(numero), bairro, cidade, estado, complemento);

        localidadeDAO.inserirLocalidade(localidade);

        requisicao.setAttribute("mensagemPopup", "Localidade Cadastrada!");
        requisicao.getRequestDispatcher("/recursos/paginas/localidade/cadastro-localidade.jsp").forward(requisicao, resposta);
    }

    private void excluirLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        Long idLocalidade = Long.parseLong(requisicao.getParameter("id-localidade"));

        Localidade localidade = localidadeDAO.consultarLocalidadeId(idLocalidade);

        if (localidade == null) {
            requisicao.getRequestDispatcher("localidade-nao-encontrada").forward(requisicao, resposta);
            return;
        }

        localidadeDAO.deletarLocalidade(localidade);

        resposta.sendRedirect("localidades");
    }

    private void atualizarLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        Long idLocalidade = Long.parseLong(requisicao.getParameter("id-localidade"));
        String logradouro = requisicao.getParameter("logradouro");
        String tipo = requisicao.getParameter("tipo");
        String numero = requisicao.getParameter("numero");
        String bairro = requisicao.getParameter("bairro");
        String cidade = requisicao.getParameter("cidade");
        String estado = requisicao.getParameter("estado");
        String complemento = requisicao.getParameter("complemento");

        Localidade localidade = localidadeDAO.consultarLocalidadeId(idLocalidade);

        if (localidade == null) {
            requisicao.getRequestDispatcher("localidade-nao-encontrada").forward(requisicao, resposta);
            return;
        }

        localidade.setLogradouro(logradouro);
        localidade.setTipo(tipo);
        localidade.setNumero(Short.parseShort(numero));
        localidade.setBairro(bairro);
        localidade.setCidade(cidade);
        localidade.setEstado(estado);
        localidade.setComplemento(complemento);

        localidadeDAO.atualizarLocalidade(localidade);

        resposta.sendRedirect("localidades");

    }

    private void mostrarTelaAtualizaLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        requisicao.getRequestDispatcher("/recursos/paginas/localidade/cadastro-localidade.jsp").forward(requisicao, resposta);
    }

    private void mostrarTelaConsultaLocalidade(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        Utilitario.checarUsuarioLogadoMostrarTelas(requisicao, resposta);

        String parametro = requisicao.getParameter("parametro");

        if (parametro != null) {
            List<Localidade> listaLocalidades = localidadeDAO.consultarLocalidadePorParametro(parametro);

            if (listaLocalidades != null && !listaLocalidades.isEmpty()) {
                requisicao.setAttribute("listaLocalidades", listaLocalidades);
            }
        }

        requisicao.getRequestDispatcher("/recursos/paginas/localidade/consultar-localidades.jsp").forward(requisicao, resposta);
    }

    private void buscarEstados(HttpServletRequest requisicao, HttpServletResponse resposta) throws IOException {

        List<String> estados = localidadeDAO.recuperarEstados();

        enviarRespostaJson(estados, resposta);
    }

    private void buscarCidades(HttpServletRequest requisicao, HttpServletResponse resposta) throws IOException {

        String estado = requisicao.getParameter("estado");
        List<String> cidades = localidadeDAO.recuperarCidadesPorEstado(estado);

        enviarRespostaJson(cidades, resposta);
    }

    private void buscarBairros(HttpServletRequest requisicao, HttpServletResponse resposta) throws IOException {

        String estado = requisicao.getParameter("estado");
        String cidade = requisicao.getParameter("cidade");

        List<String> bairros = localidadeDAO.recuperarBairrosPorCidade(estado, cidade);

        enviarRespostaJson(bairros, resposta);
    }

    private void buscarLogradouros(HttpServletRequest requisicao, HttpServletResponse resposta) throws IOException {

        String estado = requisicao.getParameter("estado");
        String cidade = requisicao.getParameter("cidade");
        String bairro = requisicao.getParameter("bairro");

        List<String> logradouros = localidadeDAO.recuperarLogradourosPorBairro(estado, cidade, bairro);

        enviarRespostaJson(logradouros, resposta);
    }

    private void enviarRespostaJson(List<String> dados, HttpServletResponse resposta) throws IOException {

        resposta.setContentType("application/json");
        resposta.setCharacterEncoding("UTF-8");
        resposta.getWriter().write(new Gson().toJson(dados));
    }

    private void erro(HttpServletRequest requisicao, HttpServletResponse resposta) throws ServletException, IOException {

        requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
    }
}