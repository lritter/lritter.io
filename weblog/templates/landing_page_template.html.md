Type: Template
Title: Landing Page Template

<!DOCTYPE html>
<html lang="en">
<head>
	<title>{weblog-title}{separator}{post-title}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="fediverse:creator" content="@lritter@social.lol" />

	{feeds}

	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/nav.css" id="navigation">
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/mono-light.min.css" media="" id="light-theme">
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/mono-dark.min.css" media="none" id="dark-theme">
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/mono.min.css">
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/mono-color.min.css">
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/printed.css">
</head>
<body>

<div class="container">
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
	<a rel="me" href="https://social.lol/@lritter" style="visibility: hidden;">Mastodon</a>
</footer>

</div>
</body>
</html>
