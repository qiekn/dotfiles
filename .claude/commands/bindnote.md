Bind a Notion page for quick note-taking with `/renote`.

## Instructions

The user provides a Notion page URL as `$ARGUMENTS`.

1. If `$ARGUMENTS` is empty, check if `.claude/.boundnote` exists:
   - If it exists, read it and display the current binding (title + URL), then stop.
   - If not, tell the user to provide a Notion page URL: `/bindnote <url>`, then stop.

2. Extract the page ID from the URL. Use the `notion-fetch` MCP tool to verify the page is accessible and get its title.

3. Write the binding info to `.claude/.boundnote` as JSON:
   ```json
   {
     "page_id": "<extracted-page-id>",
     "title": "<page-title>",
     "url": "<original-url>"
   }
   ```

4. Confirm: "Bound to: **<title>**"
