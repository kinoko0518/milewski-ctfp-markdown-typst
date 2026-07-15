mkdir -p out

find ./japanese ./english -type f -name "*.md" | while read -r file; do
    clean_path="${file#./}"
    outfile="out/${clean_path%.md}.typ"
    echo "Converting: $file -> $outfile"
    mkdir -p "$(dirname "$outfile")"

    pandoc "$file" \
        -o "$outfile" \
        --lua-filter=tex-to-typst.lua
done

find ./out -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    ln -snf ../../images "$dir/images"
done
find ./out -mindepth 2 -maxdepth 2 -type d | while read -r dir; do
    ln -snf ../../../images "$dir/images"
done

echo "All convertion completed."
