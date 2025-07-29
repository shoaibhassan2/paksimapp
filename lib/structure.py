import os

def print_dart_tree_and_files(root_path, prefix=''):
    entries = sorted(os.listdir(root_path))
    entries = [e for e in entries if os.path.isdir(os.path.join(root_path, e)) or e.endswith('.dart')]

    for index, entry in enumerate(entries):
        path = os.path.join(root_path, entry)
        is_last = index == len(entries) - 1
        branch = '└── ' if is_last else '├── '
        print(prefix + branch + entry)

        new_prefix = prefix + ('    ' if is_last else '│   ')
        if os.path.isdir(path):
            print_dart_tree_and_files(path, new_prefix)
        elif entry.endswith('.dart'):
            try:
                print_dart_file_content(path)
            except Exception as e:
                print(f"{new_prefix}[Error reading {path}: {e}]")

def print_dart_file_content(file_path):
    rel_path = os.path.relpath(file_path)
    print(f"\n--- Dart File: {rel_path} ---")
    with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
        print(f.read())
    print(f"--- End of {rel_path} ---\n")

if __name__ == '__main__':
    print("📦 Dart Project Structure and File Contents:\n")
    print_dart_tree_and_files(os.getcwd())
