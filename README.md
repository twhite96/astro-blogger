# Astro Blogger

**Astro Blogger** is an [Astro](https://astro.build) theme for blogging that demonstrates multiple concepts that are currently not directly supported in Astro such as index page pagination and an RSS feed with full post content in each item.

## Basic structure

Astro Blogger uses [MDX](https://docs.astro.build/en/guides/markdown-content/#mdx-features) files for blog post content. They are kept in src/content/posts, and are globbed by src/pages/index.astro, src/pages/[slug].astro, and src/pages/[page].astro.

There is one main layout, Base.astro, located in src/layouts. It makes use of additional Astro components for the header, menu, pagination pager, and post content rendering, located in src/components.

Utilities such as date/time functions are kep in src/components/utilities.

Initially Astro Blogger used a global css file in src/styles/styles.css for all styling, but I am moving styles to individual Astro components with locally scoped <style></style> tags where it makes sense and doesn't break styling.
