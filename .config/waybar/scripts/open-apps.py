#!/usr/bin/env python3
import json
import subprocess

def get_current_workspace_id():
    workspaces: list[dict] = json.loads(subprocess.check_output(["niri", "msg", "--json", "workspaces"]))
    for ws in workspaces:
        if ws.get("is_focused", False):
            return ws["id"]
    return None

def get_windows(workspace_id):
    windows = json.loads(subprocess.check_output(["niri", "msg", "--json", "windows"]))
    return [w for w in windows if w.get("workspace_id") == workspace_id]

def main():
    workspace_id = get_current_workspace_id()
    if workspace_id is None:
        return

    windows = get_windows(workspace_id)

    # Sort windows by their pos_in_scrolling_layout (leftmost first)
    windows_sorted = sorted(windows, key=lambda w: w["layout"]["pos_in_scrolling_layout"])

    # Extract app_ids and join them with spaces
    app_ids = [w["app_id"] for w in windows_sorted]
    print(" ".join(app_ids))

if __name__ == "__main__":
    main()

