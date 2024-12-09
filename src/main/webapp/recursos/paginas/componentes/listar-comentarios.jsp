<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    function mostrarFormularioResposta(idComentario) {
        document.getElementById('formulario-resposta-' + idComentario).style.display = 'block';
        document.getElementById('botao-responder-' + idComentario).style.display = 'none';
    }

    function ocultarFormularioResposta(idComentario) {
        document.getElementById('formulario-resposta-' + idComentario).style.display = 'none';
        document.getElementById('botao-responder-' + idComentario).style.display = 'inline-block';
    }
</script>

<div class="comentarios">
    <c:forEach var="comentario" items="${listaComentarios}">
        <div class="comentario">
            <div>
                <%-- <span class="nome">${comentario.usuario.nome} ${comentario.usuario.sobrenome}</span> --%>
                <span class="data">${comentario.dataHora}</span>
            </div>
            <input type="hidden" name="id-comentario" value="${comentario.id}">
            <div>${comentario.conteudo}</div>

            <button id="botao-responder-${comentario.id}" class="botao-curtir"
                    onclick="mostrarFormularioResposta(${comentario.id})">Responder
            </button>

            <div id="formulario-resposta-${comentario.id}" style="display: none;">
                <form action="inserir-resposta" method="post">
                    <input type="hidden" name="id-comentario" value="${comentario.id}"/>
                    <input type="hidden" name="id-incidente" value="${comentario.incidente.id}"/>
                    <textarea name="conteudo" placeholder="Escreva sua resposta aqui..." required></textarea>
                    <div class="reacoes">
                        <button type="submit" class="botao-curtir">Enviar</button>
                        <button type="reset" class="botao-curtir" onclick="ocultarFormularioResposta(${comentario.id})">Cancelar</button>
                    </div>
                </form>
            </div>

        </div>
    </c:forEach>
</div>