<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    function mostrarFormularioComentario() {
        document.getElementById('formulario-comentario').style.display = 'block';
        document.getElementById('botao-comentar').style.display = 'none';
    }

    function ocultarFormularioComentario() {
        document.getElementById('formulario-comentario').style.display = 'none';
        document.getElementById('botao-comentar').style.display = 'inline-block';
    }
</script>

<button class="botao-curtir" id="botao-comentar" onclick="mostrarFormularioComentario()">Comentar</button>

<div id="formulario-comentario" style="display: none;">
    <form id="form-comentario" action="inserir-comentario" method="post">
        <div class="formulario-grupo">
            <input type="hidden" name="id-incidente" value="${incidente.id}">
            <textarea name="conteudo" placeholder="Insira seu comentário" required maxlength="350"></textarea>
        </div>
        <div class="reacoes">
            <button type="submit" class="botao-curtir">Enviar</button>
            <button type="reset" class="botao-curtir" onclick="ocultarFormularioComentario()">Cancelar</button>
        </div>
    </form>
</div>

