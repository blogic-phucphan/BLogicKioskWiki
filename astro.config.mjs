import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";
import react from "@astrojs/react";
import remarkToc from "remark-toc";
import remarkCollapse from "remark-collapse";
import sitemap from "@astrojs/sitemap";
import mdx from "@astrojs/mdx";

// https://astro.build/config
export default defineConfig({
  site: "https://order.blogicsystems.com/wiki/kiosk",
  server: {
    port: 9625
  },
  integrations: [
    tailwind({
      config: {
        applyBaseStyles: false
      }
    }),
    mdx(),
    react(),
    sitemap(),
  ],
  markdown: {
    remarkPlugins: [
      remarkToc,
      [remarkCollapse, { test: "Table of contents" }]
    ],
    shikiConfig: {
      theme: "one-dark-pro"
    },
    extendDefaultPlugins: true
  }
});