package avisaai.modelo.dao.contato;

import javax.persistence.criteria.*;

import avisaai.modelo.entidade.usuario.Usuario_;
import avisaai.modelo.entidade.usuario.contato.Contato_;
import org.hibernate.Session;

import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.contato.Contato;
import avisaai.modelo.factory.conexao.ConexaoFactory;

public class ContatoDAOImpl implements ContatoDAO {

	private final ConexaoFactory fabrica = new ConexaoFactory();

	public void inserirContato(Contato contato) {

		Session sessao = null;

		try {

			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();

			sessao.save(contato);

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

	public void deletarContato(Contato contato) {

		Session sessao = null;

		try {

			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();

			sessao.remove(contato);

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

	public void atualizarContato(Contato contato) {

		Session sessao = null;

		try {

			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();

			sessao.update(contato);

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

			contato = sessao.createQuery(criteria).getSingleResult();

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
		return contato;
	}
	
	public Contato consultarContatoId(Long id) {
		
		Session sessao = null;
		Contato contato = null;
		
		try {
			
			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();
			
			CriteriaBuilder construtor = sessao.getCriteriaBuilder();
			CriteriaQuery<Contato> criteria = construtor.createQuery(Contato.class);
			Root<Contato> raizContato = criteria.from(Contato.class);
			
			ParameterExpression<Long> idContato = construtor.parameter(Long.class);
			criteria.select(raizContato).where(construtor.equal(raizContato.get("id"), idContato));
			
			contato = sessao.createQuery(criteria).getSingleResult();
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

		return contato;
	}

	public Usuario consultarUsuarioPorContatoEmail(String email, Contato contato) {

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

			ParameterExpression<String> emailContato = construtor.parameter(String.class);
			criteria.where(construtor.equal(juncaoContato.get(Contato_.email), emailContato));

			usuario	= sessao.createQuery(criteria).setParameter(emailContato, contato.getEmail()).getSingleResult();
			sessao.getTransaction().commit();

		}	catch (Exception exception) {
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

	public boolean consultarContatoEmail(String email) {

		Session sessao = null;
		Contato contato = null;

		try {

			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();

			CriteriaBuilder construtor = sessao.getCriteriaBuilder();

			CriteriaQuery<Contato> criteria = construtor.createQuery(Contato.class);
			Root<Contato> raizContato = criteria.from(Contato.class);

			ParameterExpression<String> emailContato = construtor.parameter(String.class);
			criteria.select(raizContato).where(construtor.equal(raizContato.get("email"), emailContato));

			criteria.select(raizContato);

			contato	= sessao.createQuery(criteria).getSingleResult();
			sessao.getTransaction().commit();

		}	catch (Exception exception) {
			if (sessao.getTransaction() != null) {
				sessao.getTransaction().rollback();
			}
			exception.printStackTrace();
		} finally {
			if (sessao != null) {
				sessao.close();
			}
		}
		return true;
	}

	public boolean consultarContatoTelefone(String telefone) {

		Session sessao = null;
		Contato contato = null;

		try {

			sessao = fabrica.getConexao().openSession();
			sessao.beginTransaction();

			CriteriaBuilder construtor = sessao.getCriteriaBuilder();

			CriteriaQuery<Contato> criteria = construtor.createQuery(Contato.class);
			Root<Contato> raizContato = criteria.from(Contato.class);

			ParameterExpression<String> telefoneContato = construtor.parameter(String.class);
			criteria.select(raizContato).where(construtor.equal(raizContato.get("telefone"), telefoneContato));

			criteria.select(raizContato);

			contato = sessao.createQuery(criteria).getSingleResult();
			sessao.getTransaction().commit();

		}	catch (Exception exception) {
			if (sessao.getTransaction() != null) {
				sessao.getTransaction().rollback();
			}
			exception.printStackTrace();
		} finally {
			if (sessao != null) {
				sessao.close();
			}
		}
		return true;
	}
}