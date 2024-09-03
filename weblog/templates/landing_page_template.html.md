Type: Template
Title: Landing Page Template

<!DOCTYPE html>
<html lang="en">
<head>
<title>{weblog-title}{separator}{post-title}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
{feeds}
<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/style.css"/>
</head>
<body>

<header>
	<h1 class="weblog-title"><a href="{base-path}">{weblog-title}</a></h1>
	{navigation}
</header>

<main>

{body}

<hr>

</main>

<footer>
  <script src="https://status.lol/lritter.js?time&link&fluent"></script>
</footer>

</body>
</html>
