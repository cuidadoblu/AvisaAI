package avisaai.modelo.dao.comunidade;

import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.localidade.Localidade;

import java.util.List;

public interface ComunidadeDAO {

	void inserirComunidade(Comunidade comunidade);

	void deletarComunidade(Comunidade comunidade);

	void atualizarComunidade(Comunidade comunidade);

	List<Comunidade> recuperarComunidades();

	List<Comunidade> consultarComunidadePorNome(String nome);

	Comunidade consultarComunidadeId(Long id);
}