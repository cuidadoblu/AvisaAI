package avisaai.modelo.dao.localidade;

import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.entidade.localidade.Localidade_;
import avisaai.modelo.factory.conexao.ConexaoFactory;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public class LocalidadeDAOImpl implements LocalidadeDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirLocalidade(Localidade localidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(localidade);

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

    public void deletarLocalidade(Localidade localidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.remove(localidade);

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

    public Localidade consultarLocalidadeId(Long id) {

        Session sessao = null;
        Localidade localidade = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade).where(construtor.equal(raizLocalidade.get(Localidade_.id), id));

            localidade = sessao.createQuery(criteria).getSingleResult();

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

        return localidade;
    }

    public void atualizarLocalidade(Localidade localidade) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(localidade);

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

    public List<Localidade> recuperarLocalidades() {

        Session sessao = null;
        List<Localidade> localidades = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade);

            localidades = sessao.createQuery(criteria).getResultList();

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

        return localidades;
    }

    public List<Localidade> consultarLocalidadePorLogradouro(String logradouro) {

        Session sessao = null;
        List<Localidade> localidades = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade).where(construtor.equal(raizLocalidade.get("logradouro"), logradouro));

            localidades = sessao.createQuery(criteria).getResultList();

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

        return localidades;
    }

    public List<Localidade> consultarLocalidadePorCidade(String cidade) {

        Session sessao = null;
        List<Localidade> localidades = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade).where(construtor.equal(raizLocalidade.get("cidade"), cidade));

            localidades = sessao.createQuery(criteria).getResultList();

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

        return localidades;
    }

    public List<Localidade> consultarLocalidadePorBairro(String bairro) {

        Session sessao = null;
        List<Localidade> localidades = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade).where(construtor.equal(raizLocalidade.get("bairro"), bairro));

            localidades = sessao.createQuery(criteria).getResultList();

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

        return localidades;
    }

    public List<String> recuperarEstados() {

        List<String> estados = new ArrayList<>();
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<String> criteria = construtor.createQuery(String.class);
            Root<Localidade> raiz = criteria.from(Localidade.class);
            criteria.select(raiz.get("estado")).distinct(true);

            estados = sessao.createQuery(criteria).getResultList();
            sessao.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return estados;
    }

    public List<String> recuperarCidadesPorEstado(String estado) {

        List<String> cidades = new ArrayList<>();
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<String> criteria = construtor.createQuery(String.class);
            Root<Localidade> raiz = criteria.from(Localidade.class);
            criteria.select(raiz.get("cidade")).distinct(true)
                    .where(construtor.equal(raiz.get("estado"), estado));

            cidades = sessao.createQuery(criteria).getResultList();
            sessao.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return cidades;
    }

    public List<String> recuperarBairrosPorCidade(String estado, String cidade) {

        List<String> bairros = new ArrayList<>();
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<String> criteria = construtor.createQuery(String.class);
            Root<Localidade> raiz = criteria.from(Localidade.class);
            criteria.select(raiz.get("bairro")).distinct(true)
                    .where(construtor.and(
                            construtor.equal(raiz.get("estado"), estado),
                            construtor.equal(raiz.get("cidade"), cidade)
                    ));

            bairros = sessao.createQuery(criteria).getResultList();
            sessao.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return bairros;
    }

    public List<String> recuperarLogradourosPorBairro(String estado, String cidade, String bairro) {

        List<String> logradouros = new ArrayList<>();
        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<String> criteria = construtor.createQuery(String.class);
            Root<Localidade> raiz = criteria.from(Localidade.class);
            criteria.select(raiz.get("logradouro")).distinct(true)
                    .where(construtor.and(
                            construtor.equal(raiz.get("estado"), estado),
                            construtor.equal(raiz.get("cidade"), cidade),
                            construtor.equal(raiz.get("bairro"), bairro)
                    ));

            logradouros = sessao.createQuery(criteria).getResultList();
            sessao.getTransaction().commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }
        return logradouros;
    }

    public List<Localidade> consultarLocalidadePorParametro(String parametro) {

        List<Localidade> localidades = new ArrayList<>();

        try {

            Session sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade)
                    .where(construtor.like(raizLocalidade.get("logradouro"), "%" + parametro + "%"))
                    .orderBy(construtor.asc(raizLocalidade.get("logradouro")));
            localidades.addAll(sessao.createQuery(criteria).getResultList());

            String[] campos = {"bairro", "cidade", "estado"};
            for (String campo : campos) {
                criteria.select(raizLocalidade)
                        .where(construtor.like(raizLocalidade.get(campo), "%" + parametro + "%"))
                        .orderBy(construtor.asc(raizLocalidade.get(campo)));

                for (Localidade localidade : sessao.createQuery(criteria).getResultList()) {
                    if (!localidades.contains(localidade)) {
                        localidades.add(localidade);
                    }
                }
            }

            sessao.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return localidades;
    }
}