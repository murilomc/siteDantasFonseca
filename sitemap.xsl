<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="pt-BR">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Sitemap | Dantas Fonseca Advocacia</title>

        <style><![CDATA[
          :root {
            --bg: #f4f5f7;
            --surface: #ffffff;
            --text: #182433;
            --muted: #687382;
            --accent: #9b7a42;
            --accent-dark: #72572d;
            --navy: #14283f;
            --line: #dfe3e8;
            --header-bg: #e9edf2;
            --shadow: 0 20px 55px rgba(20, 40, 63, .10);
          }

          * {
            box-sizing: border-box;
          }

          body {
            margin: 0;
            font-family: Inter, Arial, Helvetica, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.55;
          }

          main {
            width: min(calc(100% - 32px), 1120px);
            margin: 0 auto;
            padding: 56px 0;
          }

          .hero {
            margin-bottom: 30px;
          }

          .eyebrow {
            margin: 0 0 12px;
            color: var(--accent);
            font-size: .78rem;
            font-weight: 800;
            letter-spacing: .16em;
            text-transform: uppercase;
          }

          h1 {
            margin: 0 0 14px;
            color: var(--navy);
            font-family: Georgia, "Times New Roman", serif;
            font-size: clamp(2.4rem, 6vw, 4.8rem);
            line-height: 1.05;
            font-weight: 500;
          }

          p {
            max-width: 760px;
            color: var(--muted);
            font-size: 1.06rem;
          }

          .summary {
            display: inline-flex;
            align-items: center;
            min-height: 42px;
            margin-top: 8px;
            padding: 0 18px;
            border-radius: 999px;
            background: var(--surface);
            border: 1px solid var(--line);
            color: var(--accent-dark);
            font-weight: 800;
          }

          .card {
            overflow: hidden;
            border: 1px solid var(--line);
            border-radius: 22px;
            background: var(--surface);
            box-shadow: var(--shadow);
          }

          table {
            width: 100%;
            border-collapse: collapse;
          }

          th,
          td {
            padding: 18px 20px;
            border-bottom: 1px solid var(--line);
            text-align: left;
            vertical-align: top;
          }

          th {
            color: var(--navy);
            font-size: .78rem;
            letter-spacing: .12em;
            text-transform: uppercase;
            background: var(--header-bg);
          }

          tr:last-child td {
            border-bottom: 0;
          }

          tbody tr:hover {
            background: #faf9f6;
          }

          a {
            color: var(--accent-dark);
            font-weight: 800;
            text-decoration: none;
            overflow-wrap: anywhere;
          }

          a:hover {
            color: var(--navy);
            text-decoration: underline;
          }

          .meta {
            color: var(--muted);
            white-space: nowrap;
          }

          footer {
            margin-top: 24px;
            color: var(--muted);
            font-size: .95rem;
          }

          footer strong {
            color: var(--navy);
          }

          @media (max-width: 720px) {
            main {
              padding: 36px 0;
            }

            table,
            thead,
            tbody,
            tr,
            th,
            td {
              display: block;
            }

            thead {
              display: none;
            }

            tr {
              padding: 16px 18px;
              border-bottom: 1px solid var(--line);
            }

            tr:last-child {
              border-bottom: 0;
            }

            td {
              padding: 6px 0;
              border: 0;
            }

            td::before {
              content: attr(data-label);
              display: block;
              margin-bottom: 2px;
              color: var(--muted);
              font-size: .72rem;
              font-weight: 800;
              letter-spacing: .1em;
              text-transform: uppercase;
            }

            .meta {
              white-space: normal;
            }
          }
        ]]></style>
      </head>

      <body>
        <main>
          <section class="hero">
            <p class="eyebrow">Sitemap XML</p>

            <h1>Mapa do site</h1>

            <p>
              Relação das páginas públicas do site Dantas Fonseca Advocacia
              enviadas aos mecanismos de busca para facilitar o rastreamento
              e a indexação do conteúdo.
            </p>

            <div class="summary">
              <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
              <xsl:text> URLs publicadas</xsl:text>
            </div>
          </section>

          <section class="card">
            <table>
              <thead>
                <tr>
                  <th>URL</th>
                  <th>Atualização</th>
                  <th>Frequência</th>
                  <th>Prioridade</th>
                </tr>
              </thead>

              <tbody>
                <xsl:for-each select="sitemap:urlset/sitemap:url">
                  <tr>
                    <td data-label="URL">
                      <a href="{sitemap:loc}">
                        <xsl:value-of select="sitemap:loc"/>
                      </a>
                    </td>

                    <td class="meta" data-label="Atualização">
                      <xsl:value-of select="sitemap:lastmod"/>
                    </td>

                    <td class="meta" data-label="Frequência">
                      <xsl:value-of select="sitemap:changefreq"/>
                    </td>

                    <td class="meta" data-label="Prioridade">
                      <xsl:value-of select="sitemap:priority"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </section>

          <footer>
            <strong>Dantas Fonseca Advocacia</strong>
            <xsl:text> | Direito Público, Compliance e Regulação</xsl:text>
          </footer>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
