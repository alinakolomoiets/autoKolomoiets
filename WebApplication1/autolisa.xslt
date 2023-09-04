<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"			
>
    <xsl:output method="html" encoding="utf-8"/>

	<xsl:template match="/">
		Esimine auto :
		<xsl:value-of select ="/autod/auto[1]/autonumber"/>
		<br></br>
		Viimane auto:
		<xsl:value-of select ="/autod/auto[last()]/autonumber"/> 
		<br></br>
		Autonumber, Omanik:
		<xsl:value-of select="concat(/autod/auto[1]/autonumber, ' , ', /autod/auto[1]/omanik)"/>
		<br/>
		Loendame autodeArv:
		<xsl:value-of select ="count(/autod/auto)"/>
		<br/>
		Autod , kus on väljastamise asta=2017
		<xsl:value-of select ="count(/autod/auto[v_aasta=2017])"/>
		<br/>
		<strong>Kordused</strong>
		<br/>
		Kõik omanikud:
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:value-of select="omanik"/>
				</li>
			</xsl:for-each>
		</ul>
		<br/>
		Kõik omanikud - variant 2:
		<ol>
			<xsl:for-each select="autod/auto/omanik">
				<li>
					<xsl:value-of select="."/>
				</li>
			</xsl:for-each>
		</ol>
		<br/>
		Omanikunimest esimised tähed:
		<xsl:for-each select ="autod/auto">
			<xsl:value-of select="substring(omanik, 1, 1)"/>,
		</xsl:for-each>
		<br/>
		Omanikunimest viimased tähed:
		<xsl:for-each select ="autod/auto">
			<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,
		</xsl:for-each>
		<br/>
		Autonumbrid , mis algavad 1:
		(kasutamine starts-with funktsiooni)
		<ul>
			<xsl:for-each select="autod/auto[starts-with(autonumber, '1')]">
				<xsl:sort select="v-aasta" order="descending"/>
				<li>
					<xsl:value-of select="concat(autonumber, ' , ', v_aasta)"/>
				</li>
			</xsl:for-each>
		</ul>
		<br/>
		<style>
			table{
			border: solid;
			width:100%}
			td , th{
			border::1px solid #dddddd
			text-align: left;
			padding:6px;
			}
			tr:nth-child(-n+11) {
			background-color:	#AFEEEE;
			}
			tr:nth-child(even) {
			background-color:	#D8BFD8;
			}
		</style>
		Tabel autod:
		<table>
			<tr>
				<th>Autonumber</th>
				<th>Mark</th>
				<th>Aasta</th>
				<th>Omanik</th>
			</tr>
			<xsl:for-each select="autod/auto">
			<tr>
				<th><xsl:value-of select ="autonumber"/></th>
				<th><xsl:value-of select ="mark"/></th>
				<th><xsl:value-of select ="v_aasta"/></th>
				<th><xsl:value-of select ="omanik"/></th>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		* Trüki välja auto registrinumbri numbrite osa:
		<xsl:for-each select ="autod/auto">
			<xsl:value-of select="substring(autonumber ,1,3)"/>,
		</xsl:for-each>
		<br/>
		* Trüki välja auto registrinumbri tähtede osa:
		<xsl:for-each select ="autod/auto">
			<xsl:value-of select="substring(autonumber ,4,6)"/>,
		</xsl:for-each>
		<br/>
		*Leia, mitme auto registrimärgi numbritest viimane on 1 või 2 : 
		<xsl:value-of select="(/autod/auto [substring(autonumber,  1, 1 )='1' or substring(autonumber, 1, 1)='2'])"/>,
		<br/>
		Väljasta andmed tabelina: registrinumbrid ühes ning perekonnanimed teises tulbas.
		<table>
			<tr>
				<th>Autonumber</th>
				<th>Omanik</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<th>
						<xsl:value-of select ="autonumber"/>
					</th>
					<th>
						<xsl:value-of select ="omanik"/>
					</th>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		
		<br/>
		Kõik aasta:
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:value-of select="v_aasta"/>
				</li>
			</xsl:for-each>
		</ul>
		Viimased tähed
		<br/>
		<xsl:for-each select ="autod/auto">
			<xsl:value-of select="substring(mark, 1, 1)"/>,
		</xsl:for-each>
		
	</xsl:template>	  
</xsl:stylesheet>