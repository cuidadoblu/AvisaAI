<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>AvisaAí - Cadastrar Localidade</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
<main>
    <div class="container-cadastro">
        <div class="cabecalho-cadastro">
            <h2>Cadastrar Localidade</h2>
        </div>
        <form action="inserir-localidade" method="post">
            <div class="formulario-entradas">
                <div class="formulario-grupo">
                    <label for="estado">Estado</label>
                    <input
                            type="text"
                            id="estado"
                            name="estado"
                            list="estados"
                            placeholder="Digite o estado"
                            required
                    />
                    <datalist id="estados">
                        <option value="Santa Catarina"></option>
                    </datalist>
                </div>

                <div class="formulario-grupo">
                    <label for="cidade">Cidade</label>
                    <input
                            type="text"
                            id="cidade"
                            name="cidade"
                            list="cidades"
                            placeholder="Digite a cidade"
                            required
                    />
                    <datalist id="cidades">
                        <option value="Blumenau"></option>
                    </datalist>
                </div>

                <div class="formulario-grupo">
                    <label for="bairro">Bairro</label>
                    <input
                            type="text"
                            id="bairro"
                            name="bairro"
                            list="bairros"
                            placeholder="Digite o bairro"
                            required
                    />
                    <datalist id="bairros">
                        <option value="Água Verde"></option>
                        <option value="Asilo"></option>
                        <option value="Badenfurt"></option>
                        <option value="Bom Retiro"></option>
                        <option value="Boa Vista"></option>
                        <option value="Centro"></option>
                        <option value="Da Glória"></option>
                        <option value="Do Salto"></option>
                        <option value="Escola Agrícola"></option>
                        <option value="Fortaleza"></option>
                        <option value="Fortaleza Alta"></option>
                        <option value="Garcia"></option>
                        <option value="Itoupava Central"></option>
                        <option value="Itoupava Norte"></option>
                        <option value="Itoupava Rega"></option>
                        <option value="Itoupava Seca"></option>
                        <option value="Jardim Blumenau"></option>
                        <option value="Jardim Europa"></option>
                        <option value="Ponta Aguda"></option>
                        <option value="Progresso"></option>
                        <option value="Ribeirão Fresco"></option>
                        <option value="Ribeirão da Velha"></option>
                        <option value="Salto Weissbach"></option>
                        <option value="Testo Salto"></option>
                        <option value="Valparaíso"></option>
                        <option value="Velha"></option>
                        <option value="Velha Central"></option>
                        <option value="Velha Grande"></option>
                        <option value="Vila Formosa"></option>
                        <option value="Vila Itoupava"></option>
                        <option value="Vorstadt"></option>
                    </datalist>
                </div>

                <div class="formulario-grupo">
                    <label for="tipo">Tipo</label>
                    <input
                            type="text"
                            id="tipo"
                            name="tipo"
                            list="tipos"
                            placeholder="Selecione o tipo"
                            required
                    />
                    <datalist id="tipos">
                        <option value="Rua">Rua</option>
                        <option value="Avenida">Avenida</option>
                        <option value="Praça">Praça</option>
                        <option value="Travessa">Travessa</option>
                        <option value="Alameda">Alameda</option>
                        <option value="Rodovia">Rodovia</option>
                        <option value="Viela">Viela</option>
                        <option value="Largo">Largo</option>
                        <option value="Estrada">Estrada</option>
                        <option value="Caminho">Caminho</option>
                        <option value="Beco">Beco</option>
                        <option value="Passagem">Passagem</option>
                        <option value="Servidão">Servidão</option>
                        <option value="Via">Via</option>
                        <option value="Passeio">Passeio</option>
                        <option value="Parque">Parque</option>
                    </datalist>
                </div>

                <div class="formulario-grupo">
                    <label for="logradouro">Logradouro</label>
                    <input
                            type="text"
                            id="logradouro"
                            name="logradouro"
                            placeholder="Escreva o logradouro..."
                            maxlength="30"
                            required
                    />
                </div>

                <div class="formulario-grupo">
                    <label for="numero">Número</label>
                    <input
                            type="number"
                            id="numero"
                            name="numero"
                            placeholder="Número da residência..."
                            required
                    />
                </div>

                <div class="formulario-grupo">
                    <label for="complemento">Complemento</label>
                    <input
                            type="text"
                            id="complemento"
                            name="complemento"
                            placeholder="Escreva o complemento..."
                            maxlength="30"
                    />
                </div>

                <div class="formulario-botoes">
                    <button type="reset" class="botao-limpar">Limpar</button>
                    <button type="submit" class="botao-confirmar">Confirmar</button>
                </div>
            </div>
        </form>
    </div>
</main>
</body>
</html>