    const menuButton = document.querySelector(".menu-toggle");
    const menu = document.querySelector(".site-nav");
    const progress = document.getElementById("reading-progress");
    const article = document.getElementById("article-body");
    const topicSelect = document.getElementById("topic-select");
    const tocLinks = [...document.querySelectorAll(".toc a")];
    const sections = tocLinks
      .map((link) => document.querySelector(link.getAttribute("href")))
      .filter(Boolean);
    const toast = document.getElementById("toast");

    menuButton.addEventListener("click", () => {
      const isOpen = menu.classList.toggle("is-open");
      menuButton.setAttribute("aria-expanded", String(isOpen));
    });

    menu.querySelectorAll("a").forEach((link) => {
      link.addEventListener("click", () => {
        menu.classList.remove("is-open");
        menuButton.setAttribute("aria-expanded", "false");
      });
    });

    const updateReadingProgress = () => {
      const start = article.offsetTop;
      const end = start + article.offsetHeight - window.innerHeight;
      const value = Math.min(100, Math.max(0, ((window.scrollY - start) / (end - start)) * 100));
      progress.style.width = `${value}%`;
    };

    const updateActiveTopic = () => {
      let currentId = sections[0]?.id;
      sections.forEach((section) => {
        if (section.getBoundingClientRect().top <= 150) currentId = section.id;
      });
      tocLinks.forEach((link) => {
        const active = link.getAttribute("href") === `#${currentId}`;
        link.classList.toggle("active", active);
        if (active) link.setAttribute("aria-current", "location");
        else link.removeAttribute("aria-current");
      });
      if (currentId) topicSelect.value = `#${currentId}`;
    };

    window.addEventListener("scroll", () => {
      updateReadingProgress();
      updateActiveTopic();
    }, { passive: true });

    topicSelect.addEventListener("change", () => {
      if (!topicSelect.value) return;
      document.querySelector(topicSelect.value)?.scrollIntoView({ behavior: "smooth" });
    });

    const showToast = (message) => {
      toast.textContent = message;
      toast.classList.add("show");
      window.setTimeout(() => toast.classList.remove("show"), 1800);
    };

    const copyArticleLink = async () => {
      const link = "https://dantasfonseca.adv.br/artigos/marco-legal-transporte-publico/";
      try {
        await navigator.clipboard.writeText(link);
        showToast("Link copiado");
      } catch {
        showToast("Não foi possível copiar o link");
      }
    };

    document.getElementById("copy-link").addEventListener("click", copyArticleLink);
    document.querySelector(".rail-copy").addEventListener("click", copyArticleLink);
    document.getElementById("print-article").addEventListener("click", () => window.print());

    document.getElementById("font-toggle").addEventListener("click", (event) => {
      const enabled = document.body.classList.toggle("large-text");
      event.currentTarget.setAttribute("aria-pressed", String(enabled));
      event.currentTarget.querySelector("span").textContent = enabled ? "Texto normal" : "Aumentar texto";
    });

    const words = article.innerText.trim().split(/\s+/).length;
    const minutes = Math.max(1, Math.ceil(words / 210));
    document.getElementById("reading-time").textContent = `${minutes} min de leitura`;

    updateReadingProgress();
    updateActiveTopic();
