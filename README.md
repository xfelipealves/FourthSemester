# Fourth Semester C++ Coursework Archive

This repository preserves fourth-semester university coursework, with C++ as
the main programming focus. It also contains supporting work in Assembly,
MATLAB/Octave, PostgreSQL, diagrams, reports, screenshots, and exported
database files. It is an academic archive, not a single application or a
uniformly buildable software project.

The original source and directory layout are retained for provenance. The
sections below identify useful representative entry points based on the files
currently present; they do not declare a canonical release for every assignment
variant.

## Clone

```text
https://github.com/xfelipealves/FourthSemester.git
```

```bash
git clone https://github.com/xfelipealves/FourthSemester.git
cd FourthSemester
```

## Featured Work

### Airport route planner with Dijkstra's algorithm

- [Representative source](<Estrutura%20de%20dados%202/trab%20n2%20final/trab%20grafo%20Arrumado/untitled/main.cpp>)
- [Graph implementation](<Estrutura%20de%20dados%202/trab%20n2%20final/trab%20grafo%20Arrumado/untitled/Grafo.cpp>)
- [Input fixture](<Estrutura%20de%20dados%202/trab%20n2%20final/trab%20grafo%20Arrumado/entrada.txt>)
- [qmake project](<Estrutura%20de%20dados%202/trab%20n2%20final/trab%20grafo%20Arrumado/untitled/untitled.pro>)

This is the strongest representative Data Structures 2 project. It parses
flight legs from `entrada.txt`, builds a graph of airports and connections, and
uses a matrix-backed `Grafo` with Dijkstra's algorithm to calculate a route.
The implementation also models flight departure/arrival times and transfer
waiting time, then prints the selected flights. Several earlier and backup
variants are preserved beside this path.

### Sorting algorithm laboratory

- [Benchmark entry point](<Estrutura%20de%20dados%202/trabsort/fsfsafas%20FINAL%20OFICIAL/untitled/main.cpp>)
- [Algorithm implementations](<Estrutura%20de%20dados%202/trabsort/fsfsafas%20FINAL%20OFICIAL/untitled/sort.cpp>)
- [qmake project](<Estrutura%20de%20dados%202/trabsort/fsfsafas%20FINAL%20OFICIAL/untitled/untitled.pro>)

The sorting coursework implements and compares insertion, selection, bubble,
merge, quick, heap, counting, and radix-sort routines. The benchmark creates
increasing, decreasing, and random integer vectors, measures selected
algorithms, and checks whether the results are ordered. The `trabsort` folder
also retains Visual Studio, Dev-C++, qmake, and intermediate versions, so the
large `fsfsafas FINAL OFICIAL` path is a representative snapshot rather than a
maintained benchmark suite.

### Linux Assembly number adder

- [Main Assembly program](<Arquitetura%20de%20computadores%201/201205%20trabalho%20n2/Principal.asm>)
- [Input/output procedures](<Arquitetura%20de%20computadores%201/201205%20trabalho%20n2/segundario.asm>)

This low-level exercise reads two decimal numbers, validates their characters,
converts them into integer values, adds them, and formats the result for output.
It uses NASM syntax, Linux system calls, buffers, registers, and stack-based
number formatting. The source reflects historical Linux syscall and register
conventions and should not be assumed to assemble unchanged on a modern system.

### Numerical methods in MATLAB/Octave

- [`num1.m`](<Fundamentos%20de%20computacao%204/num1.m>) applies an iterative
  root-finding calculation.
- [`questao1.m`](<Fundamentos%20de%20computacao%204/questao1.m>) evaluates a
  Lagrange interpolation polynomial.
- [`questao2.m`](<Fundamentos%20de%20computacao%204/questao2.m>) fits a linear
  model to experimental data and computes error estimates.
- [`questao3.m`](<Fundamentos%20de%20computacao%204/questao3.m>) estimates a
  derivative numerically.

The `Fundamentos de computacao 4` directory contains short numerical-method
scripts plus repeated test and exam variants. Several files use GNU Octave
syntax such as `do`, `until`, and `endif`, so Octave is the safer starting point
even though the historical coursework refers to MATLAB.

### PostgreSQL schema, queries, and database exports

- [Contest-database query set](<Projeto%20de%20banco%20de%20dados/Trabalho%20N2/trabn2.sql>)
- [Revised query set](<Projeto%20de%20banco%20de%20dados/Trabalho%20N2/trabalho-n2-consultas.sql>)
- [Social-network schema](<Projeto%20de%20banco%20de%20dados/estudo%20dirigido%20n2/criacao_tabelas.sql>)
- [Flight schema and data](<Projeto%20de%20banco%20de%20dados/provaN2/cmp1117-prova-voos.sql>)

The database material covers relational modeling, foreign keys, sample data,
joins, grouping, common table expressions, aggregates, date operations, and
report-style queries. The N2 directory also preserves PostgreSQL backup, dump,
and very large SQL export files, while the lists and exam directories retain
earlier exercises, diagrams, screenshots, and written assignment material.

## Topics Covered

- C++ graph representations, Dijkstra and BFS exercises, sorting benchmarks,
  hash-table sketches, qmake project files, and pointer-based data structures.
- Assembly buffers, validation, Linux system calls, registers, integer
  conversion, and stack usage.
- Root finding, interpolation, least-squares fitting, error estimation, and
  numerical differentiation in MATLAB/Octave-style scripts.
- PostgreSQL schemas, keys and relationships, populated datasets, joins,
  aggregation, CTEs, date functions, and query exercises.
- Historical coursework evidence including PDFs, DOC/DOCX files, diagrams,
  screenshots, archives, IDE metadata, and database exports.

## Directory Map

The map is curated rather than exhaustive. Directory names and nesting are
intentionally unchanged.

```text
Arquitetura de computadores 1/
├── 200926/                         Assembly examples and lecture material
├── 201010 Avaliacao N1/            Password-comparison assessment
├── 201017/                         Stack and procedure exercises
├── 201031/                         Multi-file Assembly exercise
├── 201107/                         Number-conversion variant
├── 201205 trabalho n2/             Two-number addition and formatting
└── *.asm                           Preserved standalone variants

Estrutura de dados 2/
├── Trab aeroporto/                 Airport graph variants and input files
├── trab n2 final/                  Final/backup graph snapshots and reports
├── trabBFS/                        BFS graph exercise
├── trabHash/                       Hash-table exercise and assignment PDF
├── trabsort/                       Sorting variants and benchmark projects
└── bfs com matriz.txt              Graph notes or input material

Fundamentos de computacao 4/
├── num1.m, num2.m                  Root-finding and quadratic-root exercises
├── questao1.m ... questao3.m       Interpolation and numerical analysis
├── prova 2/                         Exam-script variants
└── Nova pasta (2)/                 Preserved test variants

Projeto de banco de dados/
├── Listas/                         Relational-modeling and SQL exercises
├── Trabalho N1/                     Diagrams, exports, and first project files
├── Trabalho N2/                     Contest schema/query work and dumps
├── estudo dirigido n2/             Social-network schema and queries
├── provaN1/                         Diagram and database exam material
└── provaN2/                         Flight-database exam material
```

## Build and Run

There is no root-level build system, dependency manifest, automated test suite,
or project-wide target. Build one selected project at a time, inspect its local
project file, and run it from the directory expected by its source.

### Requirements

- A C++11-capable compiler such as GCC or Clang.
- `qmake` and `make` for the qmake projects. Some historical projects request
  Qt modules; others retain qmake metadata while using only standard C++.
- NASM and a compatible Linux/x86 environment for the Assembly exercises.
- GNU Octave for scripts using Octave control-flow syntax; MATLAB may require
  syntax adjustments.
- PostgreSQL client/server tools for the SQL schemas, query sets, and dumps.

### C++ graph project

The representative route project has a matching `entrada.txt` fixture and a
C++11 qmake file:

```bash
cd "Estrutura de dados 2/trab n2 final/trab grafo Arrumado/untitled"
qmake untitled.pro
make
printf "Lisboa\nPorto\n" | ./untitled
```

The program asks for the destination first and the departure airport second.
The command is a starting point for the preserved snapshot, not a claim that
every historical variant builds with the same compiler or flags.

### Sorting project

```bash
cd "Estrutura de dados 2/trabsort/fsfsafas FINAL OFICIAL/untitled"
qmake untitled.pro
make
./untitled
```

The benchmark includes quadratic algorithms and tests vectors up to 100,000
elements. It can take substantial time and should be run as coursework, not as
a production performance measurement.

### Assembly project

The following illustrates the intended NASM/linker workflow; the source uses
historical syscall and register conventions, so confirm the object format and
toolchain before relying on it:

```bash
cd "Arquitetura de computadores 1/201205 trabalho n2"
nasm -f elf64 Principal.asm -o /tmp/fourth-semester-principal.o
nasm -f elf64 segundario.asm -o /tmp/fourth-semester-segundario.o
ld -o /tmp/fourth-semester-sum \
  /tmp/fourth-semester-principal.o \
  /tmp/fourth-semester-segundario.o
/tmp/fourth-semester-sum
```

Build outputs in these examples are written under `/tmp`, keeping generated
files outside the archive. A compatible Linux/x86 toolchain or source-specific
adjustments may be required.

### MATLAB/Octave scripts

```bash
cd "Fundamentos de computacao 4"
octave --quiet questao1.m
```

Run the other `.m` files individually. The scripts are small exercises with
hard-coded data and may write results to the console or open plots; no shared
script runner is provided.

### PostgreSQL material

For a schema and query exercise, create a disposable database and apply the
files in the order appropriate to that exercise:

```bash
createdb fourth_semester_db
psql -d fourth_semester_db -f \
  "Projeto de banco de dados/estudo dirigido n2/criacao_tabelas.sql"
psql -d fourth_semester_db -f \
  "Projeto de banco de dados/estudo dirigido n2/dados.sql"
psql -d fourth_semester_db -f \
  "Projeto de banco de dados/estudo dirigido n2/consultas.sql"
```

The contest queries under `Trabalho N2` require their matching contest schema
and data. The preserved PostgreSQL custom backup can be restored separately:

```bash
createdb fourth_semester_n2
pg_restore --no-owner -d fourth_semester_n2 \
  "Projeto de banco de dados/Trabalho N2/cmp1117-trabalho-n2.backup"
```

The database exports are historical snapshots. Review ownership, PostgreSQL
version, schema dependencies, and whether a file is a plain SQL script or a
custom dump before applying it to anything other than a disposable database.

## Historical and Academic Limitations

- This is a collection of coursework snapshots. It makes no claim of
  production readiness, security, portability, performance, or complete
  correctness.
- There is no reproducible root build, shared dependency manifest, automated
  test coverage, or single canonical version of each assignment.
- Many programs expect positional input, a particular working directory, or
  course-provided data. Input fixtures are not consistent across variants.
- The C++ projects reflect historical Qt/qmake, Dev-C++, and Visual Studio
  environments. `.pro.user` and other IDE metadata preserve local context and
  may not work unchanged on another machine.
- Source and console text use Portuguese identifiers, mixed encodings, and
  platform-specific behavior. This curation does not normalize or rewrite it.
- The Assembly files target older NASM/Linux syscall conventions and are not
  portable binaries. The MATLAB-style scripts include GNU Octave-specific
  syntax and hard-coded exercise data.
- SQL scripts and dumps depend on a matching PostgreSQL schema, load order,
  version, and data assumptions. The large exports are retained as archive
  material, not advertised as clean migrations.
- Duplicate, backup, intermediate, and unfinished variants are retained. A
  directory named `final` or `oficial` is historical naming, not an assertion
  that the code is complete or canonical.
- Clearly generated compiler and IDE build outputs were removed from tracking;
  source files, documents, archives, input data, and project metadata remain.

## Cleanup Roadmap

Future cleanup should remain incremental and non-destructive:

1. Inventory each assignment and record representative variants without moving,
   renaming, or deleting coursework.
2. Verify the featured C++ projects with documented compiler, qmake, Qt, input,
   and operating-system versions.
3. Add small per-project sample inputs and run notes where their provenance is
   clear.
4. Compare duplicate graph, sorting, SQL, and numerical variants before
   describing any one as preferred; retain the originals.
5. Normalize encoding or user-facing text only in a separate, reviewed change
   when historical fidelity permits it.
6. Add focused tests or reproducible build helpers only for explicitly selected
   teaching examples.
7. Revisit IDE metadata and database exports only after deciding which
   historical artifacts are required for provenance.

This public-readiness pass is intentionally limited to documentation, ignore
rules, and removal of clearly generated tracked build outputs. It does not
rewrite C++ or other coursework source, repair exercises, move or rename files,
delete documents or archives, or otherwise alter the academic record.
