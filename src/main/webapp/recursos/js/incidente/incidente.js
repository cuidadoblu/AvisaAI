// Função para trocar a imagem principal com a miniatura clicada
	function trocarImagemPrincipal(imagemUrl) {
		document.getElementById("imagem-principal").src = imagemUrl;
	}

	// Função para mostrar campo de resposta
	function responderComentario(comentarioId) {
		const respostaContainer = document.getElementById("resposta-"
				+ comentarioId);
		respostaContainer.style.display = 'block';
	}

	// Função para fechar o campo de resposta
	function fecharResposta(comentarioId) {
		const respostaContainer = document.getElementById("resposta-"
				+ comentarioId);
		respostaContainer.style.display = 'none';
	}