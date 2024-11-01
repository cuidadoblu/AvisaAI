<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>AvisaAí - Cadastro Comunidade</title>
    <link rel="shortcut icon" href="img" type="image/x-icon"/>
    <link rel="stylesheet" href="cadastro.css"/>
</head>
<body>
<main>
    <div class="container-cadastro">
        <div class="cabecalho-cadastro">
            <a href="inserir-comunidade" class="botao-retornar">
                <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="0.5" y="1" width="23" height="23" rx="3.5" stroke="#D0D5DD"/>
                    <path d="M14 16.5L10 12.5L14 8.5" stroke="#64748B" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </a>
            <h2>Cadastrar Comunidade</h2>
        </div>
        <form action="cadastro-comunidade" method="post">
            <div class="formulario-entradas">
                <div class="formulario-grupo">
                    <label for="foto" class="arquivo-foto">Escolha uma foto</label>
                    <input type="file" id="foto" name="foto" class="arquivo-foto" accept="image/*"/>
                </div>

                <div class="formulario-grupo">
                    <label for="comunidade-nome">Comunidade</label>
                    <input type="text" id="nome" name="nome" class="formulario-controle"
                           placeholder="Escreva o nome da comunidade..." maxlength="30" required/>
                </div>

                <div class="formulario-grupo">
                    <label for="descricao">Descrição</label>
                    <textarea id="descricao" name="descricao" class="formulario-controle"
                              placeholder="Escreva uma descrição para a comunidade..." rows="4" required></textarea>
                </div>

                <div class="formulario-grupo">
                    <label for="bairro">Bairro</label>
                    <select id="bairro" name="id-bairro" required>
                        <option value="" disabled selected>Selecione o seu bairro</option>
                        <c:forEach var="bairro" items="${bairros}">
                            <option value="${bairro}">${bairro}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="formulario-botoes">
                    <button type="button" class="botao-cancelar">Cancelar</button>
                    <button type="submit" class="botao-confirmar">Confirmar</button>
                </div>
            </div>
        </form>
    </div>
</main>
</body>
</html>