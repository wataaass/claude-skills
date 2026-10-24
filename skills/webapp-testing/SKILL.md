---
name: webapp-testing
description: Toolkit for interacting with and testing local web applications using Playwright. Supports verifying frontend functionality, debugging UI behavior, capturing browser screenshots, and viewing browser logs.
license: Complete terms in LICENSE.txt
---

# Web Application Testing

Test local web apps with native Python Playwright scripts.

`scripts/with_server.py` manages server lifecycles (one or more servers). Run it with `--help` first and use it as a black box; don't read its source unless a custom solution is absolutely necessary, since it pollutes the context window.

## Choosing an approach

- **Static HTML:** read the HTML to find selectors, then write the script (open it via `file://`). If that fails or is incomplete, treat it as dynamic.
- **Dynamic app, server not running:** use `with_server.py` and write a script with only Playwright logic.
- **Dynamic app, server running:** reconnaissance, then action: navigate and wait for `networkidle`, take a screenshot or inspect the DOM, identify selectors from the rendered state, then act.

```bash
python scripts/with_server.py --server "npm run dev" --port 5173 -- python your_automation.py
# multiple servers: repeat --server/--port pairs
python scripts/with_server.py --server "cd backend && python server.py" --port 3000 \
  --server "cd frontend && npm run dev" --port 5173 -- python your_automation.py
```

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)  # always headless
    page = browser.new_page()
    page.goto('http://localhost:5173')  # server already ready
    page.wait_for_load_state('networkidle')  # CRITICAL: wait for JS before inspecting
    page.screenshot(path='inspect.png', full_page=True)  # or page.content(), page.locator('button').all()
    browser.close()
```

## Practices

- Never inspect the DOM of a dynamic app before `networkidle`.
- Prefer descriptive selectors: `text=`, `role=`, CSS, or IDs. Add waits (`wait_for_selector`, `wait_for_timeout`) where needed.
- Use `sync_playwright()` and always close the browser.
- Screenshots cost tokens when viewed: capture only the pages and widths you need.

## Examples (`examples/`)

- `element_discovery.py`: list buttons, links, and inputs on a page
- `static_html_automation.py`: automate a local HTML file via `file://`
- `console_logging.py`: capture browser console logs
