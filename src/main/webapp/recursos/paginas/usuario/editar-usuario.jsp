<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div>
    <form action="atualizar-foto-usuario" method="post" enctype="multipart/form-data">
        <div class="editar-foto">
            <label for="foto">Escolha uma foto:</label>
            <input type="file" name="foto" id="foto" accept="image/*" value='${usuario.fotoPerfil}' required>
            <button type="submit">Atualizar</button>
        </div>
    </form>
    <form action="atualizar-usuario" method="post">
        <div id="perfil-container" class="perfil-container">
            <div class="perfil-imagem">
                <img src="${usuario.fotoPerfil}"
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
</body>
<script>
    document.getElementById("botao-cancelar").addEventListener("click", function() {
        const div = document.getElementById("perfil-container");
        div.style.display = div.style.display === "block" ? "none" : "block";
    });


</script>
</html>
