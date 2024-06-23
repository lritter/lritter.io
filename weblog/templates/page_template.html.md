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
	{feeds}
	<link rel="stylesheet" href="/style.css"/>
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

		<hr>

		<h2>Recent posts</h2>

		{recent-posts}

	</main>

	<footer>
	</footer>

</body>

</html>