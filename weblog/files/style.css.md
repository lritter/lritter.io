Type: file
Content-Type: text/css
Title: Stylesheet
Location: /style.css

:root {}

* {
  box-sizing: border-box;
}

body {
  font-size: 120%;
  color: var(--foreground);
  background: var(--background);
}

header nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

header nav li {
  display: inline-block;
}

header nav li a {
  display: block;
  text-decoration: none;
  margin-right: 1em;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 1rem 0;
}

p,
li {
  line-height: 160%;
}

header,
main,
footer {
  max-width: 60em;
  margin: 2em auto;
  padding: 0 1em;
}

header {
  margin-top: 4em;
}

footer p {
  margin-top: 5em;
  font-size: 90%;
  text-align: center;
}

a:link {
  color: var(--link);
}

a:visited {
  color: var(--link);
}

a:hover {
  color: var(--link);
}

a:active {
  color: var(--link);
}

.post-info,
.post-tags {
  font-size: 85%;
  color: var(--accent);
  text-align: right;
}

.post-info i:nth-child(2) {
  margin-left: .75em;
}

.tag {
  background: var(--accent);
  color: var(--background) !important;
  padding: .3em .4em;
  margin: .8em 0 0 .4em;
  border-radius: .5em;
  text-decoration: none;
  display: inline-block;
}

hr {
  border: 0;
  height: 1px;
  margin: 2em 0;
}

code {
  padding: .2em .3em;
  border: 1px solid var(--accent);
  white-space: pre-wrap;
  word-wrap: break-word;
}

pre,
code {
  font-size: 90%;
}

pre code {
  background: #000;
  color: #eee;
  display: inline-block;
  padding: 1em;
  white-space: pre-wrap;
  word-wrap: break-word;
}

img {
  max-width: 100%;
}

table {
  border-collapse: collapse;
}

td,
th {
  padding: .75em;
  text-align: left;
  border: 1px solid var(--accent);
}

.weblog-title a {
  text-decoration: none;
  color: var(--foreground);
}