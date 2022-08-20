# Repo to demo Astro pagination bug.

Pagination size is set to 2. There are 5 posts. 3 pages will be built. Page 1 has posts 5 and 4. Page 2 has posts 3, 2, and 1. Page 3 hast post 1.

This can be fixed in pages/[page].astro by changing the pageSize parameter value from a variable to a hardcoded number.

The bug appears to be related to using a variable for the pageSize parameter.
