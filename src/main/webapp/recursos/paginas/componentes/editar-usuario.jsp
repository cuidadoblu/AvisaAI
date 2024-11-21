<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<button type="button" id="btn-configuracoes">
    <img src="${pageContext.request.contextPath}/recursos/imagens/icones/usuario/icone-configuracoes.png"
         alt="Configurações" class="icone-configuracao">
</button>
<div id="editar-perfil" class="editar-usuario">
    <div id="editar-perfil-container" class="perfil-container">
        <form action="atualizar-usuario" method="post">
            <div class="perfil-imagem">
                <form action="atualizar-foto-usuario" method="post" enctype="multipart/form-data">
                <div class="editar-foto">
                    <label for="foto"><img src="exibir-foto?id-foto=${usuarioLogado.fotoPerfil.id}" alt="Foto de ${usuarioLogado.nome}"></label>
                    <input type="file" name="foto" class="formulario-controle" id="foto" accept="image/*" required>
                    <button type="submit" class="botao-confirmar">Atualizar</button>
                </div>
            </form>
            </div>
            <input type="hidden" name="id-usuario" value="${usuario.id}">
            <div class="formulario-grupo">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" class="formulario-controle" placeholder="Nome:" value="${usuario.nome}" required>
            </div>
            <div class="formulario-grupo">
                <label for="sobrenome">Sobrenome:</label>
                <input type="text" id="sobrenome" name="sobrenome" class="formulario-controle" placeholder="Sobrenome:" value="${usuario.sobrenome}"
                       required>
            </div>
            <div class="formulario-grupo">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" class="formulario-controle" placeholder="Senha:" value="${usuario.senha}" required>
            </div>
            <div class="formulario-botoes">
                <button type="submit" id="botao-confirmar" class="botao-confirmar">Confirmar</button>

                <div class="botao-cancelar">
                    <button type="reset" id="botao-cancelar" class="botao-cancelar">Cancelar</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    const btnConfiguracoes = document.getElementById("btn-configuracoes");
    const editarPerfil = document.getElementById("editar-perfil");

    btnConfiguracoes.addEventListener("click", () => {
        editarPerfil.style.display = "flex";
    });

    document.getElementById("botao-cancelar").addEventListener("click", () => {
        editarPerfil.style.display = "none";
    });
</script>
</html>
