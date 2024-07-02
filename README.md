# Fourth Semester

This project contains coursework and assignments from various subjects that I took during the fourth semester at university. The assignments are written in C++, Assembly, MATLAB, and SQL, focusing on systems programming, data structures, computer architecture, and database management.

## Subjects and Descriptions

### Arquitetura de Computadores 1 (Computer Architecture 1)

In this subject, we explored the fundamental concepts of computer architecture, including the design and functioning of various hardware components. The assignments involved low-level programming in Assembly language, dealing with direct hardware manipulation, memory management, and I/O operations. The complexity ranged from simple tasks, such as creating a binary counter, to more advanced operations like managing system interrupts and direct memory access.

### Estrutura de Dados 2 (Data Structures 2)

This course focused on the implementation and analysis of data structures in C++. We covered essential structures like linked lists, stacks, queues, and trees. Assignments required implementing these structures from scratch and applying them to solve complex problems. Additionally, we implemented various sorting algorithms, analyzing their performance and understanding their applications. The tasks also included performance analysis and optimization of data manipulation operations, which were crucial in understanding the efficiency and application of each data structure in real-world scenarios.

### Fundamentos de Computação 4 (Computing Fundamentals 4)

In this subject, we delved into fundamental computing concepts using MATLAB, including algorithm development and analysis. The coursework involved writing MATLAB programs to implement sorting algorithms, binary search, and basic file operations. These assignments were designed to strengthen our problem-solving skills and understanding of core computing principles. The challenges included optimizing algorithms for performance and ensuring efficient resource utilization.

### Projeto de Banco de Dados (Database Project)

This course was centered on database design, management, and manipulation using PostgreSQL. The assignments included designing database schemas, implementing CRUD operations, and optimizing queries for performance. We worked on real-life scenarios to create and manage databases effectively. The complexity of the tasks increased as we progressed, culminating in projects that required integrating multiple database operations and ensuring data integrity and security.

## Technologies Used

- **C++**: Programming language for systems and application development.
- **Assembly**: Programming language for low-level hardware interactions.
- **MATLAB**: Numerical computing environment.
- **SQL**: Language for managing and manipulating databases.
- **PostgreSQL**: Database management system.

## How to Run

1. Clone the repository:
    ```bash
    git clone https://github.com/xfelipealves/FourthSemester.git
    ```
2. Navigate to the project directory:
    ```bash
    cd FourthSemester
    ```
3. Compile and run the C++ programs using a GCC compiler. For Assembly programs, use an assembler and emulator/simulator. This was tested on a Linux OS like Ubuntu.

Example for running a C++ program:
    ```bash
    g++ -o program_name program_name.cpp
    ./program_name
    ```

Example for running an Assembly program:
    ```bash
    nasm -f elf64 program_name.asm
    ld -s -o program_name program_name.o
    ./program_name
    ```

MATLAB programs can be run directly within the MATLAB environment.
