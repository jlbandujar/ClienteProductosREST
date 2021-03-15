<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Productos</h1>
        <div id="demo"></div>
        Nombre: <input type="text" id="nombre2" name="nombre2">
        
        <input type="text" name="buscaId" id="buscaId"><button onclick="buscaProducto()">Buscar</button>
        <h1>Crear Producto</h1>
        <form id="frmCrear" method="post" action="#">
            Id: <input type="text" id="id" name="id"><br>
            Nombre: <input type="text" id="nombre" name="nombre"><br>
             Imagen: <input type="text" id="imagen" name="imagen"><br>
             Categoria: <input type="text" id="categoria" name="categoria"><br>
             Precio: <input type="text" id="precio" name="precio"><br>
             <button id="btnAddArticle" onclick="agregaProducto()">Crear</button>
             <button id="btnAddArticle" onclick="actualizaProducto()">Actualizar</button>
        </form>

        
        
        <script>
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                   // Typical action to be performed when the document is ready:
                   let producto = JSON.parse(xhttp.responseText);
                   document.getElementById("id").value = producto.id;
                   document.getElementById("nombre").value = producto.nombre;
                   document.getElementById("imagen").value = producto.imagen;
                   document.getElementById("categoria").value = producto.categoria;
                   document.getElementById("precio").value = producto.precio;

                }
            };
            xhttp.open("GET", "http://localhost:8080/Productos-CRUD-update-insert/webresources/rest2/producto/7", true);
            xhttp.send();
                
         function buscaProducto() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                   // Typical action to be performed when the document is ready:
                   let producto = JSON.parse(xhttp.responseText);
                   document.getElementById("id").value = producto.id;
                   document.getElementById("nombre").value = producto.nombre;
                   document.getElementById("imagen").value = producto.imagen;
                   document.getElementById("categoria").value = producto.categoria;
                   document.getElementById("precio").value = producto.precio;

                }
            };
            var uri = "http://localhost:8080/Productos-CRUD-update-insert/webresources/rest2/producto/" + 
                    document.getElementById("buscaId").value;
            xhttp.open("GET", uri, true);
            xhttp.send(); 
         }       
         function agregaProducto(){
                var url="http://localhost:8080/Productos-CRUD-update-insert/webresources/rest2/producto";
                method="post";
                data = {nombre: document.getElementById("nombre").value,
                        imagen: document.getElementById("imagen").value,
                        categoria: document.getElementById("categoria").value,
                        precio: parseFloat( document.getElementById("precio").value )};
                var xhr = new XMLHttpRequest();
                xhr.open(method,url,true);
                xhr.setRequestHeader('Content-Type','application/json;charset="utf-8"');
                xhr.send(JSON.stringify(data));
                
            };
                            
         function actualizaProducto(){
                var url="http://localhost:8080/Productos-CRUD-update-insert/webresources/rest2/producto";
                method="put";
                data = {id:document.getElementById("id").value,
                        nombre: document.getElementById("nombre").value,
                        imagen: document.getElementById("imagen").value,
                        categoria: document.getElementById("categoria").value,
                        precio: parseFloat( document.getElementById("precio").value )};
                var xhr = new XMLHttpRequest();
                xhr.open(method,url,true);
                xhr.setRequestHeader('Content-Type','application/json;charset="utf-8"');
                xhr.send(JSON.stringify(data));
                
            };

        </script>
    </body>
</html>
