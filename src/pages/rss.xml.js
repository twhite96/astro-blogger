import rss from "@astrojs/rss";
import config from "config";
import path from "path";
import {rfc2822} from "../components/utilities/DateFormat";

const postImportResult = import.meta.globEager("../content/posts/**/*.md");
const posts = Object.values(postImportResult);

export const get = () =>
  rss({
    title: config.get("title"),
    description: config.get("description"),
    site: config.get("url"),
    items: Array.from(posts)
      .reverse()
      .map((post) => ({
        title: post.frontmatter.title,
        link: new URL(
          path.join(config.get("posts.path"), post.frontmatter.slug),
          config.get("url")
        ),
        pubDate: rfc2822(post.frontmatter.pubDate),
        description: post.frontmatter.description,
      })),
  });
