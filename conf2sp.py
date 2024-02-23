import os
import re

def rename_html_to_aspx(directory_path):
    for root, dirs, files in os.walk(directory_path):
        for filename in files:
            if filename.lower().endswith(".html"):
                old_path = os.path.join(root, filename)
                new_filename = filename.replace(".html", ".aspx")
                new_path = os.path.join(root, new_filename)

                # Rename the file
                os.rename(old_path, new_path)

                # Update links inside the file
                with open(new_path, "r") as file:
                    content = file.read()
                    updated_content = re.sub(r"\.html\b", ".aspx", content)

                with open(new_path, "w") as file:
                    file.write(updated_content)

if __name__ == "__main__":
    # Specify the directory containing your HTML files
    target_directory = "/path/to/your/html/files"
    rename_html_to_aspx(target_directory)
    print("Conversion complete! HTML files renamed to ASPX and links updated.")
