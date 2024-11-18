<!DOCTYPE html>
<html>
<head>
    <title>Upload de Foto</title>
</head>
<body>
<h1>Enviar Foto</h1>

<form action="salvar-foto" method="POST" enctype="multipart/form-data">
    <label for="foto">Escolha uma foto:</label>
    <input type="file" id="foto" name="foto" accept="image/*" required>
    <button type="submit">Salvar Foto</button>
</form>
</body>
</html>