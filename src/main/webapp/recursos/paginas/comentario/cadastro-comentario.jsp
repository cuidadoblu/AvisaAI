<div class="comment-section">
    <form action="inserir-comentario" method="post">
        <input type="hidden" name="id_incidente" value='${incidente.id}'>
        <input type="hidden" name="id_usuario" value='${usuariologado.id}'>
        <textarea name="conteudo" placeholder="Escreva seu comentário aqui..." required></textarea>
        <button type="submit">Enviar</button>
    </form>
</div>