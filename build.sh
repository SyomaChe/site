mkdir public
cp index.html public/index.html

# Sort alphabetically
export LC_COLLATE=C

# Compile all .typ files in /typst (excluding files starting with "_") to PDF
files=()
for f in posts/*.typ; do
  name=$(basename "$f" .typ)
  files+=("$name")
  typst compile "$f" public/$name.html --features html --format html --root ../ &
done

wait