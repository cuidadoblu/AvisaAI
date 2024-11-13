package avisaai.modelo.dao.comunidade;

import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.factory.conexao.ConexaoFactory;
import org.hibernate.Session;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

public class ComunidadeDAOImpl implements ComunidadeDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirComunidade(Comunidade comunidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(comunidade);

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

    public void deletarComunidade(Comunidade comunidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.remove(comunidade);

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

    public void atualizarComunidade(Comunidade comunidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(comunidade);

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

    public List<Comunidade> recuperarComunidades() {

        Session sessao = null;
        List<Comunidade> comunidades = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comunidade> criteria = construtor.createQuery(Comunidade.class);
            Root<Comunidade> raizComunidade = criteria.from(Comunidade.class);

            criteria.select(raizComunidade);

            comunidades = sessao.createQuery(criteria).getResultList();

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

        return comunidades;
    }

    public List<Comunidade> consultarComunidadePorNome(String nome) {

        Session sessao = null;
        List<Comunidade> comunidades = new ArrayList<Comunidade>();

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comunidade> criteria = construtor.createQuery(Comunidade.class);
            Root<Comunidade> raizComunidade = criteria.from(Comunidade.class);

            criteria.select(raizComunidade)
                    .where(construtor.like(raizComunidade.get("nome"), "%" + nome + "%"))
                    .orderBy(construtor.asc(raizComunidade.get("nome")));
            comunidades.addAll(sessao.createQuery(criteria).getResultList());

            comunidades = sessao.createQuery(criteria).getResultList();

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
        return comunidades;
    }

    public Comunidade consultarComunidadeId(Long id) {

        Session sessao = null;
        Comunidade comunidade = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Comunidade> criteria = construtor.createQuery(Comunidade.class);
            Root<Comunidade> raizComunidade = criteria.from(Comunidade.class);

            criteria.select(raizComunidade).where(construtor.equal(raizComunidade.get("id"), id));

            comunidade = sessao.createQuery(criteria).getSingleResult();
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

        return comunidade;
    }
}