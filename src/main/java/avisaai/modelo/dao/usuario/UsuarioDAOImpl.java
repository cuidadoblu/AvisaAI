package avisaai.modelo.dao.usuario;

import java.util.List;

import javax.persistence.criteria.*;

import avisaai.modelo.dao.contato.ContatoDAO;
import avisaai.modelo.dao.contato.ContatoDAOImpl;
import avisaai.modelo.entidade.usuario.contato.Contato;
import avisaai.modelo.entidade.usuario.contato.Contato_;
import org.hibernate.Session;

import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.Usuario_;
import avisaai.modelo.factory.conexao.ConexaoFactory;

public class UsuarioDAOImpl implements UsuarioDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirUsuario(Usuario usuario) {
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(usuario);

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {

            if (sessao != null) {
                sessao.close();
            }
        }

    }

    public void deletarUsuario(Usuario usuario) {
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.remove(usuario);

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {

            if (sessao != null) {
                sessao.close();
            }
        }

    }

    public void atualizarUsuario(Usuario usuario) {
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(usuario);

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {

            if (sessao != null) {
                sessao.close();
            }
        }

    }

    public List<Usuario> consultarUsuarioNome(String nome) {
        Session sessao = null;
        List<Usuario> usuarios = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Usuario> criteria = construtor.createQuery(Usuario.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            criteria.where(construtor.like(raizUsuario.get(Usuario_.nome), "%" + nome + "%"));

            usuarios = sessao.createQuery(criteria).getResultList();

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return usuarios;
    }

    public List<Usuario> recuperarUsuarios(Usuario usuario) {
        Session sessao = null;
        List<Usuario> usuarios = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Usuario> criteria = construtor.createQuery(Usuario.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            criteria.select(raizUsuario);

            usuarios = sessao.createQuery(criteria).getResultList();

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {

            if (sessao != null) {
                sessao.close();
            }
        }

        return usuarios;
    }

    public Usuario consultarUsuarioId(Long id) {
        Session sessao = null;
        Usuario usuario = null;

        try {
            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Usuario> criteria = construtor.createQuery(Usuario.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            criteria.select(raizUsuario).where(construtor.equal(raizUsuario.get("id"), id));

            usuario = sessao.createQuery(criteria).uniqueResult();

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {
            sqlException.printStackTrace();

            if (sessao != null && sessao.getTransaction().isActive()) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return usuario;
    }

    public boolean checarCredenciaisUsuario(String email, String senha) {
        Session sessao = null;
        boolean existeCredenciais = false;

        try {
            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Long> criteria = construtor.createQuery(Long.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            Join<Usuario, Contato> juncaoContato = raizUsuario.join(Usuario_.contato);

            Predicate predicadoSenhaUsuario = construtor.equal(raizUsuario.get(Usuario_.senha), senha);
            Predicate predicadoEmailUsuario = construtor.equal(juncaoContato.get(Contato_.email), email);

            criteria.select(construtor.count(raizUsuario)).where(construtor.and(predicadoSenhaUsuario, predicadoEmailUsuario));

            Long resultado = sessao.createQuery(criteria).getSingleResult();
            existeCredenciais = (resultado != null && resultado > 0);

            sessao.getTransaction().commit();
        } catch (Exception exception) {
            if (sessao != null && sessao.getTransaction().isActive()) {
                sessao.getTransaction().rollback();
            }
            exception.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return existeCredenciais;
    }

    public Usuario recuperarUsuarioPorCredenciais(String email, String senha) {

        Session sessao = null;
        Usuario usuario = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Usuario> criteria = construtor.createQuery(Usuario.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            criteria.select(raizUsuario);

            Join<Usuario, Contato> juncaoContato = raizUsuario.join(Usuario_.contato);

            Predicate predicadoSenhaUsuario = construtor.equal(raizUsuario.get(Usuario_.senha), senha);

            Predicate predicadoEmailUsuario = construtor.equal(juncaoContato.get(Contato_.email), email);

            Predicate predicadoResultado = construtor.and(predicadoSenhaUsuario, predicadoEmailUsuario);
            criteria.where(predicadoResultado);

            usuario = sessao.createQuery(criteria).getSingleResult();

            sessao.getTransaction().commit();

        } catch (Exception exception) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            exception.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return usuario;
    }

    public Contato recuperarContatoUsuario(Usuario usuario) {

        Session sessao = null;
        Contato contato = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Contato> criteria = construtor.createQuery(Contato.class);
            Root<Contato> raizContato = criteria.from(Contato.class);

            criteria.select(raizContato);

            Join<Contato, Usuario> juncaoUsuario = raizContato.join((Contato_.usuario));

            ParameterExpression<Long> idUsuario = construtor.parameter(Long.class);
            criteria.where(construtor.equal(juncaoUsuario.get(Usuario_.id), idUsuario));

            contato = sessao.createQuery(criteria).setParameter(idUsuario, usuario.getId()).getSingleResult();

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            sqlException.printStackTrace();
            if (sessao.getTransaction() != null) {
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return contato;
    }
}