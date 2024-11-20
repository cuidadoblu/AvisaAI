<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div id="editar-perfil" class="editar-usuario" style="z-index: 2; display: none;">
    <form action="atualizar-foto-usuario" method="post" enctype="multipart/form-data">
        <div class="editar-foto">
            <label for="foto">Escolha uma foto:</label>
            <input type="file" name="foto" id="foto" accept="image/*" value="${usuario.fotoPerfil}" required>
            <button type="submit">Atualizar</button>
        </div>
    </form>
    <form action="atualizar-usuario" method="post">
        <div id="editar-perfil-container" class="perfil-container">
            <div class="perfil-imagem">
                <img src="exibir-foto?id-foto=${fotoPerfil.id}"
                     alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
            </div>
            <input type="hidden" name="id-usuario" value="${usuario.id}">
            <div class="editar-usuario">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" placeholder="Nome:" value="${usuario.nome}" required>
            </div>
            <div class="editar-usuario">
                <label for="sobrenome">Sobrenome:</label>
                <input type="text" id="sobrenome" name="sobrenome" placeholder="Sobrenome:" value="${usuario.sobrenome}" required>
            </div>
            <div class="editar-usuario">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" placeholder="Senha:" value="${usuario.senha}" required>
            </div>
            <div class="formulario-botoes">
                <button type="submit" id="botao-confirmar" class="botao-confirmar">Confirmar</button>

                <div class="botao-cancelar">
                    <button type="reset" id="botao-cancelar" class="botao-cancelar">Cancelar</button>
                </div>
            </div>
        </div>
    </form>
</div>
<style>
    #editar-perfil {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #editar-perfil-container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 400px;
        max-width: 90%;
    }
</style>
</html>
