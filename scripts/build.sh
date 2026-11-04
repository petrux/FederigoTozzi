#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define root and main directories
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BOOKS_DIR="${ROOT_DIR}/books"
OUTPUT_DIR="${ROOT_DIR}/build"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Function to compile a single book project
compile_book() {
    local book_dir="$1"
    local book_name=$(basename "${book_dir}")
    
    if [ ! -f "${book_dir}/main.tex" ]; then
        echo "⚠️ Warning: No main.tex found in ${book_name}, skipping..."
        return
    fi

    echo "========================================"
    echo "🔨 Compiling: ${book_name}"
    echo "========================================"

    # Enter the book directory to handle relative paths correctly
    cd "${book_dir}"

    # Compile with pdflatex, sending build artifacts to the output directory
    # Running twice to ensure proper Table of Contents (TOC) rendering
    pdflatex -interaction=nonstopmode -output-directory="${OUTPUT_DIR}" -jobname="${book_name}" main.tex
    pdflatex -interaction=nonstopmode -output-directory="${OUTPUT_DIR}" -jobname="${book_name}" main.tex

    echo "✅ PDF successfully generated: build/${book_name}.pdf"
    echo ""
}

# Main execution logic
if [ -n "$1" ]; then
    # If a specific book folder name is passed as an argument
    TARGET_BOOK="${BOOKS_DIR}/$1"
    if [ -d "${TARGET_BOOK}" ]; then
        compile_book "${TARGET_BOOK}"
    else
        echo "❌ Error: The book '$1' does not exist in the books/ directory."
        exit 1
    fi
else
    # Otherwise, iterate through and compile all books inside books/
    echo "🚀 Starting compilation for all books..."
    for book_path in "${BOOKS_DIR}"/*; do
        if [ -d "${book_path}" ]; then
            compile_book "${book_path}"
        fi
    done
fi

echo "🎉 Build process completed successfully!"