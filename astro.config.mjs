import {defineConfig} from "astro/config";
import embeds from "astro-embed/integration";
import image from "@astrojs/image";
import mdx from "@astrojs/mdx";
import remarkGfm from "remark-gfm";
import sitemap from "@astrojs/sitemap";
import solid from "@astrojs/solid-js";

// https://astro.build/config
export default defineConfig({
  site: "https://astrosites.space",
  trailingSlash: "ignore",
  outDir: "dist",
  integrations: [embeds(), sitemap(), image(), mdx(), solid()],
  markdown: {
    remarkPlugins: [remarkGfm],
    extendDefaultPlugins: true,
  },
  vite: {
    ssr: {
      external: ["svgo"],
      noExternal: [
        "@astro-community/astro-embed-twitter",
        "@astro-community/astro-embed-youtube",
      ],
    },
  },
});
