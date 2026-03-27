curl -L https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz \
  | tar -xJ
mv typst-x86_64-unknown-linux-musl/typst /usr/local/bin/

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