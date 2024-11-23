package avisaai.modelo.dao.foto;

import java.util.List;

import avisaai.modelo.entidade.foto.Foto;
import avisaai.modelo.entidade.incidente.Incidente;

public interface FotoDAO {

	void inserirFoto(Foto foto);

	void deletarFoto(Foto foto);

	void atualizarFoto(Foto foto);

	List<Foto> recuperarFotos();

	Foto consultarFotoId(Long id);

	List<Foto> recuperarFotosIncidente(Incidente incidente);
}