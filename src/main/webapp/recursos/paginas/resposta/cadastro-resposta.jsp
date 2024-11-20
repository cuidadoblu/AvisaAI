<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<button id="botao-responder-${comentario.id}" class="botao-curtir" onclick="mostrarFormularioResposta(${comentario.id})">Responder</button>

<div id="formulario-resposta-${comentario.id}" style="display: none;">
    <form action="inserir-resposta" method="post">
        <input type="hidden" name="id_comentario" value="${comentario.id}"/>
        <input type="hidden" name="id-incidente" value="${incidente.id}"/>
        <textarea name="conteudo" placeholder="Escreva sua resposta aqui..." required></textarea>
        <div>
            <button type="submit" class="botao-enviar">Enviar</button>
            <button type="reset" onclick="ocultarFormularioResposta(${comentario.id})">Cancelar</button>
        </div>
    </form>
</div>