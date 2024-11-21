package avisaai.modelo.dao.incidente;

import avisaai.modelo.entidade.comentario.Comentario;
import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.entidade.usuario.Usuario;
import avisaai.modelo.enumeracao.categoria.Categoria;
import avisaai.modelo.enumeracao.situacao.Situacao;

import java.util.List;

public interface IncidenteDAO {

    void inserirIncidente(Incidente incidente);

    void deletarIncidente(Incidente incidente);

    void atualizarIncidente(Incidente incidente);

    List<Comentario> consultarQuantidadeComentariosIncidente(Incidente incidente);

    List<Incidente> consultarIncidentesComunidade(Comunidade comunidade);

    List<Incidente> consultarIncidentesCategoria(Categoria categoria);

    List<Incidente> consultarIncidentesUsuarioPorData(Usuario usuario);

    List<Incidente> consultarIncidentesLocalidadePorData(Localidade localidade);

    List<Incidente> consultarIncidentesLocalidade(Localidade localidade);

    List<Incidente> consultarIncidentesUsuario(Usuario usuario);

    List<Incidente> consultarIncidentesSituacao(Situacao situacao);

    Incidente consultarIncidenteId(Long id);
}