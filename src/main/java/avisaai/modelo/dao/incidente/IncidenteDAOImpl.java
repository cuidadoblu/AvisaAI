package avisaai.modelo.dao.incidente;

import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.comentario.Comentario_;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.comunidade.Comunidade_;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.incidente.Incidente_;
import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.entidade.localidade.Localidade_;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.Usuario_;
import avisaai.modelo.enumeracao.categoria.Categoria;
import avisaai.modelo.enumeracao.situacao.Situacao;
import avisaai.modelo.factory.conexao.ConexaoFactory;
import org.hibernate.Session;

import javax.persistence.criteria.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class IncidenteDAOImpl implements IncidenteDAO {

    private final ConexaoFactory fabrica = new ConexaoFactory();

    public void inserirIncidente(Incidente incidente) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.save(incidente);

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

    public void deletarIncidente(Incidente incidente) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.remove(incidente);

            sessao.getTransaction().commit();

        } catch (Exception sqlException) {

            sqlException.printStackTrace();

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }

        } finally {

            if (sessao != null) {
                sessao.clear();
            }
        }

    }

    public void atualizarIncidente(Incidente incidente) {

        Session sessao = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            sessao.update(incidente);

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

    public List<Comentario> consultarQuantidadeComentariosIncidente(Incidente incidente) {

        Session sessao = null;
        List<Comentario> comentarios = null;

        try {
            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Comentario> criteria = construtor.createQuery(Comentario.class);
            Root<Comentario> raizComentario = criteria.from(Comentario.class);

            criteria.select(raizComentario);

            Join<Comentario, Incidente> juncaoIncidente = raizComentario.join(Comentario_.incidente);

            ParameterExpression<Long> idIncidente = construtor.parameter(Long.class);
            criteria.where(construtor.equal(juncaoIncidente.get(Incidente_.id), idIncidente));

            comentarios = sessao.createQuery(criteria).setParameter(idIncidente, incidente.getId()).getResultList();

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

    public List<Incidente> consultarIncidentesComunidade(Comunidade comunidade) {

        Session sessao = null;
        List<Incidente> incidentes = new ArrayList<>();

        try {
            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            // Realiza o join e aplica o filtro
            Join<Incidente, Comunidade> juncaoComunidade = raizIncidente.join(Incidente_.comunidade);
            criteria.select(raizIncidente)
                    .where(construtor.equal(juncaoComunidade.get(Comunidade_.id), comunidade.getId()));

            incidentes = sessao.createQuery(criteria).getResultList();
            sessao.getTransaction().commit();

        } catch (Exception sqlException) {
            sqlException.printStackTrace();  // Considere substituir por um Logger em produção

            if (sessao.getTransaction() != null) {
                sessao.getTransaction().rollback();
            }
        } finally {
            if (sessao != null) {
                sessao.close();
            }
        }

        return incidentes;
    }

    public List<Incidente> consultarIncidentesCategoria(Categoria categoria) {

        Session sessao = null;
        List<Incidente> incidentes = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Categoria> juncaoCategoria = raizIncidente.join(Incidente_.categoria);

            ParameterExpression<Enum> valorCategoria = construtor.parameter(Enum.class);
            criteria.where(construtor.equal(juncaoCategoria.get(categoria.name()), valorCategoria));

            incidentes = sessao.createQuery(criteria).setParameter(valorCategoria.getName(), categoria.name()).getResultList();

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

        return incidentes;

    }

    public List<Incidente> consultarIncidentesUsuarioPorData(Usuario usuario) {

        Session sessao = null;
        List<Incidente> incidentes = null;
        LocalDateTime horaAtual = LocalDateTime.now();

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Usuario> juncaoUsuario = raizIncidente.join(Incidente_.usuario);

            Predicate predicadoIdUsuario = construtor.equal(juncaoUsuario.get(Usuario_.id), usuario.getId());

            Predicate predicadoDataHoraIncidente = construtor.equal(raizIncidente.get(Incidente_.dataHora), horaAtual);

            Predicate predicadoResultado = construtor.and(predicadoIdUsuario, predicadoDataHoraIncidente);
            criteria.where(predicadoResultado);

            incidentes = sessao.createQuery(criteria).getResultList();

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

        return incidentes;

    }

    public List<Incidente> consultarIncidentesLocalidadePorData(Localidade localidade) {

        Session sessao = null;
        List<Incidente> incidentes = null;
        LocalDateTime dataAtual = LocalDateTime.now();

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Localidade> juncaoLocalidade = raizIncidente.join(Incidente_.localidade);

            Predicate predicadoIncidentesLocalidade = construtor.equal(juncaoLocalidade.get(Localidade_.incidentes),
                    localidade.getId());

            Predicate predicadoDataHoraIncidente = construtor.equal(raizIncidente.get(Incidente_.dataHora),
                    dataAtual);

            Predicate predicadoResultado = construtor.and(predicadoIncidentesLocalidade, predicadoDataHoraIncidente);
            criteria.where(predicadoResultado);

            incidentes = sessao.createQuery(criteria).getResultList();

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

        return incidentes;

    }

    public List<Incidente> consultarIncidentesSituacao(Situacao situacao) {

        Session sessao = null;
        List<Incidente> incidentes = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Situacao> juncaoSituacao = raizIncidente.join(Incidente_.situacao);

            ParameterExpression<Enum> valorSituacao = construtor.parameter(Enum.class);
            criteria.where(construtor.equal(juncaoSituacao.get(situacao.name()), valorSituacao.getName()));

            incidentes = sessao.createQuery(criteria).setParameter(valorSituacao.getName(), situacao.name()).getResultList();

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

        return incidentes;

    }

    public List<Incidente> consultarIncidentesLocalidade(Localidade localidade) {

        Session sessao = null;
        List<Incidente> incidentes = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();

            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Localidade> juncaoLocalidade = raizIncidente.join(Incidente_.localidade);

            ParameterExpression<String> idLocalidade = construtor.parameter(String.class);
            criteria.where(construtor.equal(juncaoLocalidade.get(Localidade_.id), idLocalidade));

            incidentes = sessao.createQuery(criteria).getResultList();

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

        return incidentes;
    }

    public List<Incidente> consultarIncidentesUsuario(Usuario usuario) {

        Session sessao = null;
        List<Incidente> incidentes = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente);

            Join<Incidente, Usuario> juncaoUsuario = raizIncidente.join(Incidente_.usuario);

            Predicate predicadoIdUsuario = construtor.equal(juncaoUsuario.get(Usuario_.id), usuario.getId());

            criteria.where(predicadoIdUsuario);

            criteria.orderBy(construtor.desc(raizIncidente.get(Incidente_.dataHora)));

            incidentes = sessao.createQuery(criteria).getResultList();
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

        return incidentes;
    }

    public Incidente consultarIncidenteId(Long id) {

        Session sessao = null;
        Incidente incidente = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Incidente> criteria = construtor.createQuery(Incidente.class);
            Root<Incidente> raizIncidente = criteria.from(Incidente.class);

            criteria.select(raizIncidente).where(construtor.equal(raizIncidente.get("id"), id));

            incidente = sessao.createQuery(criteria).uniqueResult();
            sessao.getTransaction().commit();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            if (sessao != null) {
                sessao.close();
            }

            return incidente;
        }
    }

    public Usuario recuperarUsuarioPorIncidente(Incidente incidente) {

        Session sessao = null;
        Usuario usuario = null;

        try {

            sessao = fabrica.getConexao().openSession();
            sessao.beginTransaction();

            CriteriaBuilder construtor = sessao.getCriteriaBuilder();
            CriteriaQuery<Usuario> criteria = construtor.createQuery(Usuario.class);
            Root<Usuario> raizUsuario = criteria.from(Usuario.class);

            criteria.select(raizUsuario).where(construtor.equal(raizUsuario.get("incidentesCadastrados"), incidente));

            usuario = sessao.createQuery(criteria).getSingleResult();
            sessao.getTransaction().commit();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            if (sessao != null) {
                sessao.close();
            }

            return usuario;
        }
    }
}