package avisaai.modelo.dao.usuario;

import java.util.List;

import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.entidade.usuario.contato.Contato;

public interface UsuarioDAO {

	void inserirUsuario(Usuario usuario);

	void deletarUsuario(Usuario usuario);

	void atualizarUsuario(Usuario usuario);

	List<Usuario> consultarUsuarioNome(Usuario usuario);

	List<Usuario> recuperarUsuarios(Usuario usuario);

	Usuario consultarUsuarioId(Long id);

	Usuario recuperarUsuarioPorCredenciais(String email, String senha);

	Contato recuperarContatoUsuario(Usuario usuario);
}