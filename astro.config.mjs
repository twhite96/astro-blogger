import {defineConfig} from "astro/config";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://siracusasays.com",
  trailingSlash: "ignore",
  outDir: "dist",
  integrations: [sitemap()],
  vite: {
    ssr: {
      external: ["svgo"],
    },
  },
});
