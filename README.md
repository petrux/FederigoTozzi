# Federigo Tozzi - Complete Literary Works

🇮🇹 Un progetto open source dedicato a riformattare e impaginare le opere letterarie complete dell'autore italiano **Federigo Tozzi** (1883–1920) in LaTeX.

🇬🇧 An open-source project dedicated to reformatting and typesetting the complete literary works of Italian author **Federigo Tozzi** (1883–1920) in LaTeX.

## 🇮🇹 Premessa

Questo progetto nasce spontaneamente dal mio interesse per l'opera letteraria di Federigo Tozzi—purtroppo difficile da reperire nell'attuale panorama editoriale italiano—unita alla passione per la stampa tipografica in LaTeX.

La produzione letteraria originale di Federigo Tozzi è di Pubblico Dominio. Tutto il lavoro di impaginazione e il codice sorgente del presente progetto è invece rilasciato sotto licenza [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 (CC BY-NC-SA 4.0)](LICENSE), il che significa che:

- **Puoi** scaricare, compilare, studiare e condividere liberamente i file sorgente e i PDF generati.
- **Puoi** contribuire al miglioramento della formattazione o aggiungere nuove opere.
- **Non puoi** utilizzare questo specifico lavoro di impaginazione e formattazione per scopi commerciali senza autorizzazione.

Ogni contributo, correzione di refusi o suggerimento tipografico è più che bene accetto.

Grazie,  
Giulio Petrucci, alias `petrux`

## 🇬🇧 Foreword

This project was born organically out of my appreciation for the literary work of Federigo Tozzi—unfortunately hard to find in the current Italian publishing landscape—combined with my passion for LaTeX typesetting.

Federigo Tozzi's original literary production is in the Public Domain. All typesetting work and source code in this project are instead released under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 (CC BY-NC-SA 4.0)](LICENSE) license, which means that:

- **You are free to** download, compile, study, and freely share the source files and generated PDFs.
- **You are welcome to** contribute to improving the typesetting or adding new works.
- **You may not** use this specific layout and formatting work for commercial purposes without authorization.

Any contributions, typo corrections, or typography suggestions are more than welcome.

Thank you,  
Giulio Petrucci, aka `petrux`

## Getting the Books & Building from Source

### Download Pre-compiled PDFs (GitHub Actions)

If you just want to read the books without installing a LaTeX environment on your machine, you can download the `.zip` archive built automatically by the GitHub Actions workflow:

1. Sign in to your GitHub account (required by GitHub to download workflow artifacts).
2. Go to the [**Actions — Build LaTeX PDFs**](https://github.com/petrux/FederigoTozzi/actions/workflows/build-pdf.yml) workflow page of this repository.
3. Click on the latest successful workflow run (marked with a green checkmark ✅).
4. Scroll down to the **Artifacts** section at the bottom of the page and click on **`compiled-books-pdf`** to download the `.zip` archive containing all generated PDF files.

### Download the Source Content & Build PDFs Locally

#### Prerequisites

To build the books from source, you need a working **LaTeX** distribution (such as [TeX Live](https://www.tug.org/texlive/), [MacTeX](https://www.tug.org/mactex/), or [MiKTeX](https://miktex.org/)) with `pdflatex` and the required packages (`babel-italian`, `ebgaramond`, `geometry`, `microtype`, `titlesec`).

#### 1. Download the Content

Clone the repository using `git`:

```bash
git clone https://github.com/petrux/FederigoTozzi.git
cd FederigoTozzi
```

*(Alternatively, you can download the source files as a `.zip` archive by clicking the **Code → Download ZIP** button at the top of the GitHub repository page).*

#### 2. Build the PDF Files

Use the provided [`scripts/build.sh`](scripts/build.sh) script to compile the books with `pdflatex`.

To compile **all books** inside the `books/` directory:

```bash
chmod +x scripts/build.sh
./scripts/build.sh
```

To compile **a single book**, pass its folder name (inside `books/`) as an argument:

```bash
./scripts/build.sh con_gli_occhi_chiusi
```

All generated PDF files will be placed in the `build/` directory (e.g., `build/con_gli_occhi_chiusi.pdf`).
