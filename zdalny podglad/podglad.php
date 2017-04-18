<html>
<head>
	<title>Podglad obrazu</title>
</head>
<body>
<?php
	$h=$_POST["haslo"];		
	if ($h=="1234")
	{
		echo "
			<IMG src='cam.jpg' width='320'  height='240'  border='1'  name='refresh'> 
			<SCRIPT language='JavaScript' type='text/javascript'>
			<!--
				var t=20 // częstotliwość odświeżania obrazu
				image = 'cam.jpg'
				function Start() 
				{
        				tmp = new Date();
        				tmp = '?'+tmp.getTime()
        				document.images['refresh'].src = image+tmp
        				setTimeout('Start()', t*1000)
				}
				Start();
			// --> 
			</SCRIPT> ";
			echo "<br>Najblizsze ujecie za: ";
			echo "<span id='sekundy'></span>
			<script type='text/javascript'>
				o=document.getElementById('sekundy')
				function odliczaj(o,sek)
				{
					o.innerHTML=sek
					if(sek>0)setTimeout(function(){odliczaj(o,--sek)},1e3)
					if(sek==0)
					{
						sek=21
						setTimeout(function(){odliczaj(o,--sek)},1e3)
					}
				}
				odliczaj(document.getElementById('sekundy'),20)
			</script> sekund."; 
	}
	else 
	{
		echo "haslo niepoprawne";
	}
?>
</body>
</html>