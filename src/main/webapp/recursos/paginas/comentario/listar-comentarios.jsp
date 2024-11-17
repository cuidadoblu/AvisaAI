<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    (function () {
        function responderComentario(comentarioId) {
            const respostaContainer = document.getElementById("resposta-" + comentarioId);
            respostaContainer.style.display = 'block';
        }

        function fecharResposta(comentarioId) {
            const respostaContainer = document.getElementById("resposta-" + comentarioId);
            respostaContainer.style.display = 'none';
        }

        window.responderComentarioComentario = responderComentario;
        window.fecharRespostaComentario = fecharResposta;
    })();
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
            <button class="botao-responder" onclick="responderComentarioComentario('${comentario.id}')">Responder
            </button>

            <div id="resposta-${comentario.id}" class="respostas" style="display: none;">
                <span class="fechar-resposta" onclick="fecharRespostaComentario('${comentario.id}')">&times;</span>
                <form action="inserir-resposta" method="post">
                    <input type="hidden" name="id-comentario" value="${comentario.id}">
                    <textarea name="conteudo" placeholder="Escreva sua resposta..." required></textarea>
                    <button type="submit" class="botao-enviar">Enviar resposta</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>