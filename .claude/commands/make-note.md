Append notes to the bound Notion page.

## Instructions

1. Read `.claude/.boundnote` to get the bound page. If it doesn't exist, tell the user to run `/bindnote <url>` first, then stop.

2. `$ARGUMENTS` is the user's instruction for what to note down (e.g. "summarize the changes", "record the debug process"). If `$ARGUMENTS` is empty, default to: "summarize the key points from our recent conversation".

3. Based on the current conversation context and the user's instruction, compose well-organized notes in Notion Markdown format. Use headings, bullet points, and code blocks as appropriate.

4. Use the `notion-fetch` MCP tool to read the current page content.

5. Use the `notion-update-page` MCP tool with `command: "update_content"` to **append** the new notes to the end of the page. Find the last line of existing content with `old_str` and replace it with itself plus the new notes appended after it. If the page is empty, use `command: "replace_content"` instead.

6. Confirm what was written and show the page URL.
