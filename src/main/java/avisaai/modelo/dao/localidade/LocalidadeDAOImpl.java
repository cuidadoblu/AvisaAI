package avisaai.modelo.dao.localidade;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.factory.conexao.ConexaoFactory;

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

            ParameterExpression<Long> idLocalidade = construtor.parameter(Long.class);
            criteria.select(raizLocalidade).where(construtor.equal(raizLocalidade.get("id"), idLocalidade));

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
        Session sessao = null;

        try {
            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Localidade> criteria = construtor.createQuery(Localidade.class);
            Root<Localidade> raizLocalidade = criteria.from(Localidade.class);

            criteria.select(raizLocalidade)
                    .where(construtor.like(raizLocalidade.get("logradouro"), "%" + parametro + "%"))
                    .orderBy(construtor.asc(raizLocalidade.get("logradouro")));
            List<Localidade> logradouroList = sessao.createQuery(criteria).getResultList();

            criteria.select(raizLocalidade)
                    .where(construtor.like(raizLocalidade.get("bairro"), "%" + parametro + "%"))
                    .orderBy(construtor.asc(raizLocalidade.get("bairro")));
            List<Localidade> bairroList = sessao.createQuery(criteria).getResultList();

            criteria.select(raizLocalidade)
                    .where(construtor.like(raizLocalidade.get("cidade"), "%" + parametro + "%"))
                    .orderBy(construtor.asc(raizLocalidade.get("cidade")));
            List<Localidade> cidadeList = sessao.createQuery(criteria).getResultList();

            criteria.select(raizLocalidade)
                    .where(construtor.like(raizLocalidade.get("estado"), "%" + parametro + "%"))
                    .orderBy(construtor.asc(raizLocalidade.get("estado")));
            List<Localidade> estadoList = sessao.createQuery(criteria).getResultList();

            localidades.addAll(logradouroList);
            for (Localidade localidade : bairroList) {
                if (!localidades.contains(localidade)) {
                    localidades.add(localidade);
                }
            }
            for (Localidade localidade : cidadeList) {
                if (!localidades.contains(localidade)) {
                    localidades.add(localidade);
                }
            }
            for (Localidade localidade : estadoList) {
                if (!localidades.contains(localidade)) {
                    localidades.add(localidade);
                }
            }

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

        return localidades;
    }
}