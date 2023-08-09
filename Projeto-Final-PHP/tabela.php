<table id="myTable">
    <tr class="header">
        <th style="width:10%;">Título</th>
        <th style="width:10%;">Autor</th>
        <th style="width:10%;">Gênero</th>
        <th style="width:10%;">Editora</th>
        <th style="width:10%;">Conservação</th>
        <th style="width:5%;">Preço</th>
        <th style="width:10%; white-space: nowrap;"></th>
        <th style="width:10%;"></th>
    </tr>
    <?php
        while($row = $result->fetch_assoc()) {
        	echo "<tr><td>" . $row["titulo"] . "</td><td>" . $row["autor"] . "</td><td>" . $row["genero"] . "</td><td>" . $row["editora"] . "</td><td>" . $row["estadoconservacao"] . "</td><td style='white-space: nowrap;'><label>R$ </label>" . $row["preco"] . "</td><td style='display: none';>" . $row["id"] . "</td>" . "<td><a href='#'>Ver detalhes</a></td>" . "<td><input type='submit' value='Adicionar ao carrinho' id='abrir-carrinho' onclick='adicionarItem(\"" . $row["id"] . "\")'></td>";
        	}
    ?>
</table>
