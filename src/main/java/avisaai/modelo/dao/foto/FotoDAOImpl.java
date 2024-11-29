package avisaai.modelo.dao.foto;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import avisaai.modelo.entidade.incidente.Incidente;
import org.hibernate.Session;

import avisaai.modelo.entidade.foto.Foto;
import avisaai.modelo.factory.conexao.ConexaoFactory;

public class FotoDAOImpl implements FotoDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirFoto(Foto foto) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(foto);

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao != null && sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public void deletarFoto(Foto foto) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.delete(foto);

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public void atualizarFoto(Foto foto) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(foto);

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
    }

    public List<Foto> recuperarFotos() {

        Session sessao = null;
        List<Foto> fotos = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Foto> criteria = construtor.createQuery(Foto.class);
            Root<Foto> raizFoto = criteria.from(Foto.class);

            criteria.select(raizFoto);

            fotos = sessao.createQuery(criteria).getResultList();

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return fotos;
    }

    public Foto consultarFotoId(Long id) {

        Session sessao = null;
        Foto foto = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Foto> criteria = construtor.createQuery(Foto.class);
            Root<Foto> raizFoto = criteria.from(Foto.class);

            criteria.select(raizFoto).where(construtor.equal(raizFoto.get("id"), id));

            foto = sessao.createQuery(criteria).uniqueResult();

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return foto;
    }

    public List<Foto> recuperarFotosIncidente(Incidente incidente) {

        Session sessao = null;
        List<Foto> fotos = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Foto> criteria = construtor.createQuery(Foto.class);
            Root<Foto> raizFoto = criteria.from(Foto.class);

            criteria.select(raizFoto)
                    .where(construtor.equal(raizFoto.get("incidenteProprietarioFoto"), incidente));

            fotos = sessao.createQuery(criteria).getResultList();

            sessao.getTransaction().commit();
        } catch (Exception sqlException) {
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
            sqlException.printStackTrace();
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return fotos;
    }
}