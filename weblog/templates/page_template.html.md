---
Type: Template
Title: Page Template
---

<!DOCTYPE html>
<html lang="en">

<head>
	<title>{weblog-title}{separator}{post-title}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="fediverse:creator" content="@lritter@social.lol" />
	{feeds}
	<link rel="stylesheet" href="https://raw.githack.com/lritter/lritter.io/main/assets/style.css"/>
	<a rel="me" href="https://social.lol/@lritter">Mastodon</a>
</head>

<body>

	<header>
		<h1 class="weblog-title"><a href="{base-path}">{weblog-title}</a></h1>
		{navigation}
	</header>

	<main>
		<article>
			{body}
			<aside class="post-info">
				<i class="fa-solid fa-clock"></i> {date}
			</aside>
			<aside class="post-tags">
				{tags}
			</aside>
		</article>
	</main>

	<footer>
	</footer>

</body>

</html>