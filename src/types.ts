export interface Frontmatter {
  title: string;
  ogImage?: string;
  description: string;
  author: string;
  datetime: string;
  slug: string;
  draft: boolean;
  featured: boolean;
  tags: string[];
}
