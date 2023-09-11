<?php
if(isset($_POST['submit'])){
    $xmlDoc = new DOMDocument("1.0","UTF-8");
    $xmlDoc->preserveWhiteSpace = false;
    $xmlDoc->load('MinuSugupuu.xml');
    $xmlDoc->formatOutput = true;

    $xml_root = $xmlDoc->documentElement;
    $xmlDoc->appendChild($xml_root);

    $xml_sugupuu = $xmlDoc->createElement("inimine");
    $xmlDoc->appendChild($xml_sugupuu);

    $xml_sugupuu->appendChild($xmlDoc->createElement('nimi',$_POST['nimi']));
    $xml_sugupuu->appendChild($xmlDoc->createElement('synd',$_POST['synd']));
    $xml_sugupuu->appendChild($xmlDoc->createElement('elukoht',$_POST['elukoht']));
    $xml_sugupuu->appendChild($xmlDoc->createElement('status',$_POST['status']));
    $lisad=$xml_sugupuu->appendChild($xmlDoc->createElement('lapsed'));
    $laps=$lisad->appendChild($xmlDoc->createElement('inimine'));
    $laps->appendChild($xmlDoc->createElement('nimi',$_POST['lisa']));


    $xml_root->appendChild($xml_sugupuu);
    $xmlDoc->save('MinuSugupuu.xml');
}
$MinuSugupuu=simplexml_load_file('MinuSugupuu.xml');
?>
<!DOCTYPE html>
<html lang="et">

<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minu sugupuu </title>
</head>

<body>
<h2>Sugulase kleepimine</h2>

<form action="" method="post" name="vorm1">
    <table>
        <tr>
            <td><label for="nimi">Sugulane nimi :</label></td>
            <td><input type="text" name="nimi" id="nimi" autofocus></td>
        </tr>
        <tr>
            <td><label for="synd">Sugulase sünnipäev:</label></td>
            <td><input type="text" name="synd" id="synd"></td>
        </tr>
        <tr>
            <td><label for="elukoht">Sugulase elukoht:</label></td>
            <td><input type="text" name="elukoht" id="elukoht"></td>
        </tr>
        <tr>
            <td><label for="status">Sugulase status:</label></td>
            <td><input type="text" name="status" id="status"></td>
        </tr>
        <tr>
            <td><label for="lisa">Lisade lapsed:</label></td>
            <td><input type="text" name="lisa" id="lisa"></td>
        </tr>
        <tr>
            <td><input type="submit" name="submit" id="submit" value="Sisesta"></td>
            <td></td>
        </tr>
    </table>
</form>
<h2>Andmed xm failist MinuSugupuu.xml</h2>
<table>
    <tr>
        <th>Nimi</th>
        <th>Sünnipäev</th>
        <th>Elukoht</th>
        <th>Status </th>
        <th>Lisad lapsed </th>
    </tr>
    <?php
    foreach ($MinuSugupuu->inimine as $sugupuu){
        echo"<tr>";
        echo"<td>".$sugupuu->nimi."</td>";
        echo"<td>".$sugupuu->synd."</td>";
        echo"<td>".$sugupuu->elukoht."</td>";
        echo"<td>".$sugupuu->status."</td>";
        echo"<td>".$sugupuu->lapsed->inimine->nimi."</td>";
        echo"</tr>";
    }
    ?>
</table>
</body>
</html>

