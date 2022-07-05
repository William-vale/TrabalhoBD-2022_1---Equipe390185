<?php
    include_once 'connection.php';

    $isbn = $_POST['isbn_codigo'];
    $titulo = $_POST['titulo_livro'];
    $autor = $_POST['nome_autor'];
    $editora = $_POST['editora'];
    $data = $_POST['data_lancamento'];
    $quantidade = $_POST['quantidade'];
    $cod_categoria = $_POST['cod_categoria'];

    $sql = "INSERT INTO livros (ISBN, título, ano_lançamento, editora, qtde_copias,nome_autor) VALUES ('$isbn',  '$titulo', '$data', '$editora', '$quantidade', '$autor');";
    mysqli_query($conn, $sql);

    header("Location: ../cadastro-admin.html?signup=sucess");


?>