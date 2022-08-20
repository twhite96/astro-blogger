import rss from "@astrojs/rss";
import config from "config";
import path from "path";
import {rfc2822} from "../components/utilities/DateFormat";

const episodeImportResult = import.meta.globEager(
  "../content/episodes/**/*.md"
);
const episodes = Object.values(episodeImportResult);

export const get = () =>
  rss({
    stylesheet: "/rss/styles.xsl",
    title: config.get("title"),
    description: config.get("description"),
    site: config.get("url"),
    items: Array.from(episodes)
      .reverse()
      .map((episode) => ({
        title: episode.frontmatter.title,
        link: new URL(
          path.join(config.get("episodes.path"), episode.frontmatter.slug),
          config.get("url")
        ),
        pubDate: rfc2822(episode.frontmatter.pubDate),
        description: episode.frontmatter.description,
        customData: `<enclosure url="${config.get("episodes.audioPrefix")}/${
          episode.frontmatter.audiofile
        }" length="${episode.frontmatter.bytes}" type="audio/mpeg" />`,
      })),
  });
