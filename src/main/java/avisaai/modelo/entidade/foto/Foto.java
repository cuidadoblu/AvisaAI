package avisaai.modelo.entidade.foto;

import avisaai.modelo.entidade.comunidade.Comunidade;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.usuario.Usuario;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "foto")
public class Foto implements Serializable {

    private static final long serialVersionUID = -832958979755616717L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_foto")
    private Long id;

    @Column(name = "conteudo_foto", nullable = false, columnDefinition = "LONGBLOB")
    private byte[] conteudo;

    @Column(name = "extensao_foto", nullable = false)
    private String extensao;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "id_incidente", referencedColumnName = "id_incidente", nullable = false)
    private Incidente incidenteProprietarioFoto;

    public Foto() {
    }

    public Foto(byte[] conteudo, String extensao) {
        setConteudo(conteudo);
        setExtensao(extensao);
    }

    public Foto(Long id, byte[] conteudo, String extensao) {
        setId(id);
        setConteudo(conteudo);
        setExtensao(extensao);
    }

    public Foto(byte[] conteudo, String extensao, Incidente incidenteProprietarioFoto) {
        setConteudo(conteudo);
        setExtensao(extensao);
        setIncidenteProprietarioFoto(incidenteProprietarioFoto);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getConteudo() {
        return conteudo;
    }

    public void setConteudo(byte[] conteudo) {
        this.conteudo = conteudo;
    }

    public String getExtensao() {
        return extensao;
    }

    public void setExtensao(String extensao) {
        this.extensao = extensao;
    }

    public Incidente getIncidenteProprietarioFoto() {
        return incidenteProprietarioFoto;
    }

    public void setIncidenteProprietarioFoto(Incidente incidenteProprietarioFoto) {
        this.incidenteProprietarioFoto = incidenteProprietarioFoto;
    }

    public int hashCode() {
        return Objects.hash(id);
    }

    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Foto outro = (Foto) obj;
        return Objects.equals(id, outro.id);
    }
}