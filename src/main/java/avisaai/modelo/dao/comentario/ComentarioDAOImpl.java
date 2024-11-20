package avisaai.modelo.dao.comentario;

import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.comentario.Comentario_;
import avisaai.modelo.entidade.comentario.resposta.Resposta;
import avisaai.modelo.entidade.comentario.resposta.Resposta_;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.factory.conexao.ConexaoFactory;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

public class ComentarioDAOImpl implements ComentarioDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirComentario(Comentario comentario) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(comentario);

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

    public void deletarComentario(Comentario comentario) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.delete(comentario);

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

    public void atualizarComentario(Comentario comentario) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(comentario);

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

    public List<Comentario> recuperarComentarios() {

        Session sessao = null;
        List<Comentario> comentarios = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comentario> criteria = construtor.createQuery(Comentario.class);
            Root<Comentario> raizComentario = criteria.from(Comentario.class);

            criteria.select(raizComentario);

            comentarios = sessao.createQuery(criteria).getResultList();

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
        return comentarios;
    }

    public List<Comentario> consultarComentarioIncidente(Incidente incidente) {

        Session sessao = null;
        List<Comentario> comentarios = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comentario> criteria = construtor.createQuery(Comentario.class);
            Root<Comentario> raizComentario = criteria.from(Comentario.class);

            Join<Comentario, Incidente> juncaoIncidente = raizComentario.join(Comentario_.incidente);
            criteria.where(construtor.equal(juncaoIncidente.get("id"), incidente.getId()));

            comentarios = sessao.createQuery(criteria).getResultList();

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
        return comentarios;
    }

    public List<Comentario> consultarComentarioUsuario(Usuario usuario) {

        Session sessao = null;
        List<Comentario> comentarios = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comentario> criteria = construtor.createQuery(Comentario.class);
            Root<Comentario> raizComentario = criteria.from(Comentario.class);

            Join<Comentario, Usuario> juncaoUsuario = raizComentario.join(Comentario_.usuario);
            criteria.where(construtor.equal(juncaoUsuario.get("id"), usuario.getId()));

            comentarios = sessao.createQuery(criteria).getResultList();

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
        return comentarios;
    }

    public List<Resposta> consultarRespostasComentario(Comentario comentario) {

        Session sessao = null;
        List<Resposta> respostas = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Resposta> criteria = construtor.createQuery(Resposta.class);
            Root<Resposta> raizResposta = criteria.from(Resposta.class);

            Join<Resposta, Comentario> juncaoComentario = raizResposta.join(Resposta_.comentarioOrigem);
            criteria.where(construtor.equal(juncaoComentario.get(Comentario_.id), comentario.getId()));

            respostas = sessao.createQuery(criteria).getResultList();

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

        return respostas;
    }

    public Comentario consultarComentarioId(Long id) {

        Session sessao = null;
        Comentario comentario = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Comentario> criteria = construtor.createQuery(Comentario.class);
            Root<Comentario> raizComentario = criteria.from(Comentario.class);

            criteria.select(raizComentario)
                    .where(construtor.equal(raizComentario.get("id"), id));

            comentario = sessao.createQuery(criteria).uniqueResult();

            sessao.getTransaction().commit();

        } catch (Exception exception) {

            exception.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {

            if (sessao != null) {
                sessao.close();
            }
        }

        return comentario;
    }
}