<div class="lista-comentarios"> 
    <h6>Comentários</h6>
    <c:forEach var="comentario" items="${listaComentarios}">
        <div class="comentario">
            <div class="autor">
                <img src="" alt="Foto do usuário">
                <span class="nome-autor">${comentario.usuario.nome}</span>
                <span class="data-hora">${comentario.dataHora}</span>
            </div>
            <div class="conteudo">
                <p class="texto-comentario">${comentario.conteudo}</p>
            </div>
            <div class="acoes">
                <a href="#" class="avaliar">Avaliar</a>
                <a href="#" class="responder">Responder</a>
            </div>
        </div>
    </c:forEach>
</div>